package io.github.simonlarsen.io;

import jolie.runtime.JavaService;
import jolie.runtime.Value;
import jolie.runtime.FaultException;

import java.io.File;
import java.io.IOException;

public class FileUtils extends JavaService {
	public Value getLastModified(String filename) {
		Value retValue = Value.create();

		File file = new File(filename);

		retValue.setValue(file.lastModified());
		return retValue;
	}

	public Value createTempFile(Value request) throws FaultException {
		Value retValue = Value.create();

		String prefix = request.getFirstChild("prefix").strValue();
		String suffix = request.getFirstChild("suffix").strValue();

		try {
			File file = File.createTempFile(prefix, suffix);

			retValue.setValue(file.getAbsolutePath());
			return retValue;
		} catch (IOException ioe) {
			throw new FaultException("CouldNotCreateFile");
		}
	}
}
