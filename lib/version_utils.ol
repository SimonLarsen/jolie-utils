include "version_utils/version_utils_interface.iol"
include "string_utils.iol"

execution { concurrent }

inputPort Input {
	Location: "local"
	Interfaces: VersionUtilsInterface
}

main {
	[ compare(request)(response) {
		asplit = request.a;
		asplit.regex = "\\.";
		split@StringUtils(asplit)(aparts);

		bsplit = request.b;
		bsplit.regex = "\\.";
		split@StringUtils(bsplit)(bparts);

		if(#aparts.result > #bparts.result) {
			parts = #aparts.result
		} else {
			parts = #bparts.result
		};

		done = false;
		for(i = 0, i < parts && !done, i++) {
			done = true;
			if(aparts.result[i] == null || aparts.result[i] == "*") {
				response = -1
			}
			else if(bparts.result[i] == null || bparts.result[i] == "*") {
				response = 1
			}
			else {
				anum = int(aparts.result[i]);
				bnum = int(bparts.result[i]);
				if(anum < bnum) {
					response = -1
				}
				else if(anum > bnum) {
					response = 1
				}
				else {
					response = 0;
					done = false
				}
			}
		}
	} ] { nullProcess }
}
