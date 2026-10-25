shader_type canvas_item;

void vertex() {
	
	//scrolling arrows
	UV.y -= TIME * 0.1;
	UV.x += cos(TIME) * 0.1;
	
}
