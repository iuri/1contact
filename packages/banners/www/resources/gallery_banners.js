
var isIE = false;
var req;
var images = new Array;
var selectedIndex = 0;
var mouseX;
/*
function loadXMLDoc(url) {
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
		req.onreadystatechange = processReqChange;
		req.open("GET", url, true);
		req.send(null);
	} else if (window.ActiveXObject) {
		isIE = true;
		req = new ActiveXObject("Microsoft.XMLHTTP");
		if (req) {
			req.onreadystatechange = processReqChange;
			req.open("GET", url, true);
			req.send();
		}
	}
	
}

function processReqChange() {
	if (req.readyState == 4) {
		if (req.status == 200) {
			processImages();
		} else {
			alert("There was a problem retrieving the XML data:\n" +
			req.statusText);
		}
	}
}

function gallery() {
	loadXMLDoc('../dm_gallery.xml');
}
*/
function processImages(){
	var items = req.responseXML.getElementsByTagName("newsitem");
	for (var i=0; i<items.length; i++) {		
		var timestamp = items[i].getElementsByTagName("timestamp");
		timestamp = timestamp[0].firstChild.nodeValue;
		var datestamp = items[i].getElementsByTagName("datestamp");
		datestamp = datestamp[0].firstChild.nodeValue;
		var imgsrc = items[i].getElementsByTagName("imgsrc");
		imgsrc = imgsrc[0].firstChild.nodeValue;
		var imgwidth = items[i].getElementsByTagName("imgwidth");
		imgwidth = imgwidth[0].firstChild.nodeValue;
		var imgheight = items[i].getElementsByTagName("imgheight");
		imgheight = imgheight[0].firstChild.nodeValue;
		var thumbsrc = items[i].getElementsByTagName("thumbsrc");
		thumbsrc = thumbsrc[0].firstChild.nodeValue;
		var headline = items[i].getElementsByTagName("headline");
		headline = headline[0].firstChild.nodeValue;
		var image = new Array(imgsrc,imgwidth,imgheight,timestamp,datestamp,thumbsrc,headline);
		images[images.length] = image;
	}
	prepareThumbs();
}

function prepareThumbs() {
	var thumbLI = document.getElementsByTagName('LI');
	for (var i=0; i<thumbLI.length; i++) {
		thumbLI[i].onclick = function () {
			var thumbsrc = this.firstChild.firstChild.getAttribute('src');
			var underscore = thumbsrc.indexOf('_');
			var lastslash = thumbsrc.indexOf('/img/');
			var thumbid =  thumbsrc.substring((lastslash+5),underscore);
			selectedIndex = getReference(thumbid);
			swapImage();
			return false;
		}
	}
}

function getReference(thumbsrc) {
	for (var i=0; i<images.length; i++) {
		if(images[i][5].indexOf(thumbsrc) != -1) {
			return i;
		}
	}
	return false;
}

function swapImage() {

	var bigimage = document.getElementById('mainimage');
	setOpacity(bigimage,0);
	bigimage.setAttribute('src','/img/' + images[selectedIndex][0]);
	bigimage.setAttribute('width',images[selectedIndex][1]);
	bigimage.setAttribute('height',images[selectedIndex][2]);
	bigimage.setAttribute('alt',images[selectedIndex][6]);
	document.getElementById('galleryimage').className = 'disc';

	//alert('0');
	
	bigimage.onload = function () {
		//kill the disc here
		document.getElementById('galleryimage').className = 'nodisc';
		fadeIn('mainimage',0);
	};

	var headers = document.getElementsByTagName('H2');
	headers[0].removeChild(headers[0].firstChild);
	var newheader = document.createTextNode(images[selectedIndex][6])
	headers[0].appendChild(newheader);
	var pubdate = document.getElementById('publishdate');
	pubdate.removeChild(pubdate.firstChild);
	var newpubdate = document.createTextNode('Published: ' + images[selectedIndex][3] + ', ' + images[selectedIndex][4])
	pubdate.appendChild(newpubdate);
	var thumbs = document.getElementsByTagName('LI');
	for (var i=0; i<thumbs.length; i++) {
		if(thumbs[i].firstChild.className == 'selected') {
			thumbs[i].firstChild.className = '';
		}
	}
	for (var i=0; i<thumbs.length; i++) {
		if(i == selectedIndex) {
			thumbs[i].firstChild.className = 'selected';
		}
	}
}

function fadeIn(objId,opacity) {
  if (document.getElementById) {
    obj = document.getElementById(objId);
    if (opacity <= 100) {
      setOpacity(obj, opacity);
      opacity += 10;
      window.setTimeout("fadeIn('"+objId+"',"+opacity+")", 100);
    }
  }
}

function setOpacity(obj, opacity) {
  opacity = (opacity == 100)?99.999:opacity;
  // IE/Win
  obj.style.filter = "alpha(opacity:"+opacity+")";
  // Safari<1.2, Konqueror
  obj.style.KHTMLOpacity = opacity/100;
  // Older Mozilla and Firefox
  obj.style.MozOpacity = opacity/100;
  // Safari 1.2, newer Firefox and Mozilla, CSS3
  obj.style.opacity = opacity/100;
	return true;
}


function banners_slider()  {
	
	//add the styles for the slider
	//css = document.createElement("link");
	//css.setAttribute("href","slider.css");
	//css.setAttribute("rel","stylesheet");
	//css.setAttribute("type","text/css");
	//document.getElementsByTagName("head")[0].appendChild(css);
	
	var listitems = document.getElementById('panel2').getElementsByTagName('LI');
	var panel = document.getElementById('panel2');

    panel.style.width = (listitems.length * 149) + "px";
    
	var timer = null;
	document.getElementById('panel1').onmouseover = function() {
		trackthemouse();
		timer = setInterval("movePanel()",10);
	}
	document.getElementById('panel1').onmouseout = function() {
		donttrackthemouse();
		clearInterval(timer);
	}

	var links = document.getElementsByTagName('A');
	for (var i=0; i<links.length; i++) {
		if(links[i].getAttribute('id') == "moveLeft") {
			var ref = this;
			links[i].timerleft = null;
			links[i].onmouseover = function() {
				ref.timerleft = setInterval("moveLeft(2)",10);
			}
			links[i].onmouseout = function() {
				clearInterval(ref.timerleft);
			}
		}
		if(links[i].getAttribute('id') == "moveRight") {
			var ref = this;
			links[i].timerright = null;
			links[i].onmouseover = function() {
				ref.timerright = setInterval("moveRight(2)",10);
			}
			links[i].onmouseout = function() {
				clearInterval(ref.timerright);
			}
		}
	}
}
///////////////////////////////


function trackthemouse() {
	document.onmousemove = getMouseXY;
	var IE = document.all?true:false;
	if (!IE) document.captureEvents(Event.MOUSEMOVE);
	function getMouseXY(e) {
		if (IE) {
			tempX = event.clientX + document.body.scrollLeft
		} else {
			tempX = e.pageX
		} 
	if (self.innerWidth) {
		frameWidth = self.innerWidth;
	}
	else if (document.documentElement && document.documentElement.clientWidth) {
		frameWidth = document.documentElement.clientWidth;
	}
	else if (document.body) {
		frameWidth = document.body.clientWidth;
	}
	var windowMiddle = (frameWidth/2);
	if (tempX < 0) {
		tempX = 0;
	}
		mouseX = tempX - windowMiddle;
	}
}

function donttrackthemouse() {
	document.onmousemove = null;
}


function movePanel() {
	var panel = document.getElementById('panel2');
	var distance = mouseX/30;
	if (distance < 0)	{
		distance = -(distance);
	}
	if (mouseX < 0) {
		moveRight(distance);
	}
	// If the mouse moves to the right, the photo will scroll to the left:
	if (mouseX > 0) {
		moveLeft(distance);
	}
}

function moveLeft(distance) {
	var panel1 = document.getElementById('panel1');
	var panel2 = document.getElementById('panel2');
	var panel1width = parseInt(panel1.offsetWidth);
	var panel2width = parseInt(panel2.offsetWidth);
	var panel2X = panel2.offsetLeft;
	var limit = 0 - panel2width + panel1width;
	if(panel2X <= 0 && panel2X > limit) {
		panel2X  = panel2X - distance;
		panel2.style.left = panel2X +"px";
		if(panel2X > limit && panel2X <= limit + distance) {
			panel2X  = limit;
			panel2.style.left = panel2X +"px";
		}
	}
}

function moveRight(distance) {
	var panel2 = document.getElementById('panel2');
	var panel2X = panel2.offsetLeft;
	if(panel2X >= 0 - distance) {
		panel2X  = panel2X + distance;
		panel2.style.left = 0 +"px";
	}
	if(panel2X < 0 ) {
		panel2X  = panel2X + distance;
		panel2.style.left = panel2X +"px";
	}
}

// ELO.functionsToCallOnload.push("slider()");
