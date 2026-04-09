#include <windows.h>
#include <psapi.h>
#include <cstring>

void ApplyIntroSkipPatch()
{
    const char* searchStr = "Data/Resources/OpeningTitles.lua";
    const char replacement[32] = { 0 };  // 32 zero bytes, exactly as the wiki hex edit
    size_t len = 32;

    HMODULE hModule = GetModuleHandle(NULL);
    if (!hModule) return;

    MODULEINFO mi = {};
    if (!GetModuleInformation(GetCurrentProcess(), hModule, &mi, sizeof(mi))) return;

    BYTE* base = (BYTE*)mi.lpBaseOfDll;
    SIZE_T size = mi.SizeOfImage;
    BYTE* end = base + size - len;

    for (BYTE* p = base; p <= end; ++p)
    {
        if (std::memcmp(p, searchStr, len) == 0)
        {
            DWORD oldProt;
            if (VirtualProtect(p, len, PAGE_EXECUTE_READWRITE, &oldProt))
            {
                std::memcpy(p, replacement, len);
                VirtualProtect(p, len, oldProt, &oldProt);
                // String is unique, so we can stop after the first match
                break;
            }
        }
    }
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD ul_reason_for_call, LPVOID lpReserved)
{
    if (ul_reason_for_call == DLL_PROCESS_ATTACH)
    {
        ApplyIntroSkipPatch();
    }
    return TRUE;
}