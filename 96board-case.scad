r = 2.0; /* connector relief */
l = 0.75; /* ledge thickness */ 
t = 3.0; /* thickness */
h = 20.0; /* height */
b = 5.0; /* bottom clearance */

/* front face */
difference() {
	translate([0, -t, -b]) {
		cube([85, t, h]);
	}
	union() {
		translate([1 - (r/2), -t, 1 - (r/2)]) {
			cube([11 + r, 15, 1 + r]);
		}
		translate([18 - (r/2), -t, 2 - (r/2)]) {
			cube([14.5 + r, 9, 5 + r]);
		}
		translate([37 - (r/2), -t, 1 - (r/2)]) {
			cube([7.5 + r, 5.25 , 3 + r]);
		}
		translate([49 - (r/2), -t, 2 - (r/2)]) {
			cube([14 + r, 14 , 7 + r]);
		}
		translate([69 - (r/2), -t, 2 - (r/2)]) {
			cube([14 + r, 14 , 7 + r]);
		}
	}
}

/* left face */
intersection() {
	translate([0, 0, -b - t]) {
		cylinder(h = h + t, r1 = t, r2 = t, $fn = 36);
	}
	translate([-t, -t, -b - t]) {
		cube([t, t, h + t]);
	}
}
translate([-t, 0, -b - t]) {
	cube([t, 54, h + t]);
}
intersection() {
	translate([0, 54, -b - t]) {
		cylinder(h = h + t, r1 = t, r2 = t, $fn = 36);
	}
	translate([-t, 54, -b - t]) {
		cube([t, t, h + t]);
	}
}

/* right face */
intersection() {
	translate([85, 0, -b - t]) {
		cylinder(h = h + t, r1 = t, r2 = t, $fn = 36);
	}
	translate([85, -t, -b - t]) {
		cube([t, t, h + t]);
	}
}
translate([85, 0, -b - t]) {
	cube([t, 54, h + t]);
}
intersection() {
	translate([85, 54, -b - t]) {
		cylinder(h = h + t, r1 = t, r2 = t, $fn = 36);
	}
	translate([85, 54, -b - t]) {
		cube([t, t, h + t]);
	}
}

/* back face */
difference() {
	translate([0, 54, -b]) {
		cube([85, t, h]);
	}
	translate([69 - (r/2), 42 + t, 1 - (r/2)]) {
		cube([9 + r, 12 , 6 + r]);
	}
}

/* bottom face */
translate([0, -t, -b - t]) {
	cube([85, 54 + 2*t, t]);
}

/* ledge */
difference() {
	translate([0, 0, -b]) {
		cube([85, 54, b]);
	}
	translate([l, l, -b]) {
		cube([85 - 2*l, 54 - 2*l, b]);
	}
}

