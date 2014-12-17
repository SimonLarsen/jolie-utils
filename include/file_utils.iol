interface FileUtilsInterface {
	RequestResponse: getLastModified(string)(long)
}

outputPort FileUtils {
	Interfaces: FileUtilsInterface
}

embedded {
	Java: "io.github.simonlarsen.io.FileUtils" in FileUtils
}
