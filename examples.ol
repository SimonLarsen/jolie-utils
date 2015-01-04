include "console.iol"

include "environment.iol"
include "file_utils.iol"
include "format.iol"
include "version_utils.iol"

main {
	/*
	 * environment.iol
	 */
	// Get single variable
	getVariable@Environment("TERM")(term);
	println@Console("Your terminal is: " + term)();

	// Get all variables
	getVariables@Environment()(vars);
	println@Console("Your browser is: " + vars.BROWSER)();

	/*
	 * file_utils.iol
	 */
	// Get file's last modification timestamp
	getLastModified@FileUtils("examples.ol")(modified);
	println@Console("examples.iol was last modified at: " + modified)();

	// Create temporary file
	tempreq.prefix = "foo";
	tempreq.suffix = "bar";
	createTempFile@FileUtils(tempreq)(temppath);
	println@Console("Temp file: " + temppath)();

	/*
	 * format.iol
	 */
	// Printf style string formatting
	format.format = "%s is %d years old.";
	format.args[0] = "John";
	format.args[1] = 34;
	format@Format(format)(output);
	println@Console(output)();
	
	// Compile string template
	template = "My name is ${name} and I am from ${country}.";
	template.name = "John";
	template.country = "Denmark";
	template@Format(template)(output);
	println@Console(output)();

	/*
	 * version_utils.iol
	 */
	// Compare version strings
	compare.a = "1.0.2";
	compare.b = "0.9.3";
	compare@VersionUtils(compare)(vercomp);
	println@Console(vercomp)();
	if(vercomp == 1) {
		println@Console(compare.a + " is newer than " + compare.b)()
	}
}
