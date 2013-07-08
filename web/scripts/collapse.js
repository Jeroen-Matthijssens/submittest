function injectCollapse () {
	var collapsablesClosed = document.querySelectorAll ("[data-toggle=parent-collapsed]");
	var collapsablesOpen = document.querySelectorAll ("[data-toggle=parent]");

	function createClose (parent, button) {
		return function () {
			parent.setAttribute ("data-toggle", "parent-collapsed");
			button.onclick = createOpen (parent, button);
		}
	}

	function createOpen (parent, button) {
		return function () {
			parent.setAttribute ("data-toggle", "parent");
			button.onclick = createClose (parent, button);
		}
	}

	for ( var i = 0; i < collapsablesClosed.length; i++ ) {
		var a = collapsablesClosed[i];
		var button = a.querySelector ("[data-toggle=click], [data-toggle=clear-click]");
		button.onclick = createOpen (a, button);
	}

	for ( var i = 0; i < collapsablesOpen.length; i++ ) {
		var a = collapsablesClosed[i];
		var button = a.querySelector ("[data-toggle=click], [data-toggle=clear-click]");
		button.onclick = createClose (a, button);
	}

}