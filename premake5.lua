project "zlib"
	kind "StaticLib"
	language "C"

	targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
	objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.c",	
		"*.h"
	}

	includedirs
	{
		"*.h"
	}

    filter "toolset:msc"
        defines
        {
            "D_CRT_SECURE_NO_DEPRECATE",
            "D_CRT_NONSTDC_NO_DEPRECATE"
        }


	filter "system:windows"
		systemversion "latest"
		cdialect "c11"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cdialect "c11"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
