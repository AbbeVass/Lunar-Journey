image_index = 0;
image_xscale = 0.1;
image_yscale = 0.1;

// The difference between the speachbuuble's origin and the contents origin
content_x_diff = (3000-400)*image_xscale;
content_y_diff = (827-3427)*image_yscale;

enum content_type {
	KEY,
	RUNES,
	NONE
}
content = content_type.NONE;