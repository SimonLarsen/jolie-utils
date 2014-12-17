package io.github.simonlarsen.environment;

import java.util.Map;
import java.util.Map.Entry;
import jolie.runtime.JavaService;
import jolie.runtime.Value;
import jolie.runtime.FaultException;

public class Environment extends JavaService {
	public Value getVariable(String name) throws FaultException {
		Value retValue = Value.create();

		String variable = System.getenv(name);

		if(variable == null) {
			throw new FaultException("EnvironmentVariableNotFound");
		} else {
			retValue.setValue(variable);
			return retValue;
		}
	}

	public Value getVariables() {
		Value retValue = Value.create();

		Map<String,String> variables = System.getenv();
		for(Map.Entry<String,String> entry : variables.entrySet()) {
			retValue.getFirstChild(entry.getKey()).setValue(entry.getValue());
		}

		return retValue;
	}
}
