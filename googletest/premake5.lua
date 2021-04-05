project "gtest"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs 
	{
		"%{IncludeDir.gtest}",
		"%{wks.location}/Tests/vendor/gtest/googletest"
	}

	links 
	{
	}

	files
	{
		"src/**.h",
		"src/**.cc"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "MQ_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "MQ_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "MQ_DIST"
		runtime "Release"
		optimize "on"
