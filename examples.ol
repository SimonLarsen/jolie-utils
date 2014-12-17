include "console.iol"

include "environment.iol"
include "file_utils.iol"
include "format.iol"

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
	println@Console(output)()

}
