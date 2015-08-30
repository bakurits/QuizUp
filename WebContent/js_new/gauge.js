	var degrees = 0;
	var new_degrees = 0;
	var difference = 0;
	window.onload = function(){
	//canvas initialization
	var canvas = document.getElementById("canvas");
	var ctx = canvas.getContext("2d");
	//dimensions
	var W = canvas.width;
	var H = canvas.height;
	//Variables
	var color = "#b2c831"; //green looks better to me
	var bgcolor = "#222";
	var text;
	var animation_loop, redraw_loop;
	
	function init()
	{
		//Clear the canvas everytime a chart is drawn
		ctx.clearRect(0, 0, W, H);
		
		//Background 360 degree arc
		ctx.beginPath();
		ctx.strokeStyle = bgcolor;
		ctx.lineWidth = 30;
		ctx.arc(W/2, H/2, 100, 0, Math.PI*2, false); //you can see the arc now
		ctx.stroke();
		
		//gauge will be a simple arc
		//Angle in radians = angle in degrees * PI / 180
		var radians = degrees * Math.PI / 180;
		ctx.beginPath();
		if(degrees>=0 && degrees<60)
			color="aqua";
		else
			if(degrees<180)
				color="#b2c831";
			else
				if(degrees<270)
					color="orange";
				else
					color="#800000";
		ctx.strokeStyle = color;
		ctx.lineWidth = 30;
		//The arc starts from the rightmost end. If we deduct 90 degrees from the angles
		//the arc will start from the topmost end
		ctx.arc(W/2, H/2, 100, 0 - 90*Math.PI/180, radians - 90*Math.PI/180, false); 
		//you can see the arc now
		ctx.stroke();
		
		//Lets add the text
		ctx.fillStyle = color;
		ctx.font = "70px open sans";
		text = degrees/36 + "s";
		//Lets center the text
		//deducting half of text width from position x
		text_width = ctx.measureText(text).width;
		//adding manual value to position y since the height of the text cannot
		//be measured easily. There are hacks but we will keep it manual for now.
		ctx.fillText(text, W/2 - text_width/2, H/2 + 15);
	}
	
	function draw()
	{
		//Cancel any movement animation if a new chart is requested
		if(typeof animation_loop != undefined) clearInterval(animation_loop);
		
		//random degree from 0 to 360
		new_degrees = degrees+36;
		//This will animate the gauge to new positions
		//The animation will take 1 second
		//time for each frame is 1sec / difference in degrees
		animation_loop = setInterval(animate_to, 1000);
	}
	
	//function to make the chart move to new degrees
	function animate_to()
	{
		//clear animation loop if degrees reaches to new_degrees
		if(degrees == 360) {
			clearInterval(animation_loop);
			degrees=0;
			var val = document.getElementById("currQues").value;
			val++;
			document.getElementById("currQues").value = val;
			$("#currQues").trigger("change");
			draw();
		}else{
			degrees+=36;			
			init();
			
		}
	}
	
	//Lets add some animation for fun
	draw();
//	redraw_loop = setInterval(draw, 2000); //Draw a new chart every 2 seconds
	
	
	
	
}
