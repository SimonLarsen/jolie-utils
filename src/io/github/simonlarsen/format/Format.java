package io.github.simonlarsen.format;

import jolie.runtime.JavaService;
import jolie.runtime.Value;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Format extends JavaService {
	public String format(Value request) {
		String format = request.getFirstChild("format").strValue();
		Object[] args = new Object[request.getChildren("args").size()];
		int i = 0;
		for(Value v : request.getChildren("args")) {
			args[i++] = v.valueObject();
		}
		return String.format(format, args);
	}

	public String template(Value request) {
		String template = request.strValue();
		StringBuilder builder = new StringBuilder();

		Pattern pattern = Pattern.compile("\\$\\{([_a-zA-Z][_a-zA-Z0-9]*)\\}");
		Matcher matcher = pattern.matcher(template);

		int i = 0;
		while(matcher.find()) {
			String replacement = request.getFirstChild(matcher.group(1)).strValue();
			builder.append(template.substring(i, matcher.start()));
			builder.append(replacement);
			i = matcher.end();
		}
		builder.append(template.substring(i, template.length()));

		return builder.toString();
	}
}
