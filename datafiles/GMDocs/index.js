// Collapsible items
var collapsible = document.getElementsByClassName("collapsible");
for (var i = 0; i < collapsible.length; i++) {
	collapsible[i].getElementsByTagName("img")[0].src = "images/arrow-right.png";
	collapsible[i].addEventListener("click", function() {
		this.classList.toggle("active");

		var content = this.nextElementSibling;
		var icon = this.getElementsByTagName("img")[0];
		
		if (content.style.maxHeight) {
			content.style.maxHeight = null;
			icon.src = "images/arrow-right.png";
		} else {
			content.style.maxHeight = "max-content";
			icon.src = "images/arrow-down.png";
		}
	});
}