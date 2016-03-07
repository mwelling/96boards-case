w = 85; /* width of 96Boards */
d = 54; /* depth of 96boaeds */

m = 0.6; /* margin for the plastic shrinking */

iw = w + m + 0.5; /* internal width, requires additional 0.5mm for LeMaker's HiKey, since LS connector has 0.5 offset */
id = d + m; /* internal depth */

r = 2.0; /* connector relief */
l = 0.75; /* ledge thickness */ 
t = 2.5; /* thickness 2mm is too thin, 3mm is too thick */
h = 18.0; /* height */
b = 5.5; /* bottom clearance */

it = t + (m/2); /* translate with margin */
im = (m/2); /* translate with margin */

difference() {
	union() {
		/* front face */
		difference() {
			translate([0, -it, -b]) {
				cube([iw, t, h]);
			}
			union() {
				translate([1 - (r/2), -it, 1 - (r/2)]) {
					cube([12 + r, 15 + im, 2 + r]);
				}
				translate([17.5 - (r/2), -it, 2.5 - (r/2)]) {
					cube([14.5 + r, 9 + im, 5 + r]);
				}
				translate([37.75 - (r/2), -it, 1 - (r/2)]) {
					cube([7.5 + r, 5.25 + im, 3 + r]);
				}
				translate([49.5 - (r/2), -it, 2 - (r/2)]) {
					cube([14 + r, 14 + im, 7 + r]);
				}
				translate([69.25 - (r/2), -it, 2 - (r/2)]) {
					cube([14 + r, 14 + im, 7 + r]);
				}
			}
		}

		/* left face */
		intersection() {
			translate([0, 0, -b - it]) {
				cylinder(h = h + t, r1 = t, r2 = t, $fn = 36 + im);
			}
			translate([-it, -it, -b - it]) {
				cube([t + im, t + im, h + t + im]);
			}
		}
		translate([-it, 0, -b - it]) {
			cube([t + im, id, h + t + im]);
		}
		intersection() {
			translate([0, id, -b - it]) {
				cylinder(h = h + t, r1 = t, r2 = t, $fn = 36 + im);
			}
			translate([-it, id, -b - it]) {
				cube([t + im, t, h + t + im]);
			}
		}

		/* right face */
		intersection() {
			translate([iw, 0, -b - it]) {
				cylinder(h = h + t, r1 = t, r2 = t, $fn = 36 + im);
			}
			translate([iw, -t, -b - it]) {
				cube([t, t, h + t + im]);
			}
		}
		translate([iw, 0, -b - it]) {
			cube([t, id, h + t + im]);
		}
		intersection() {
			translate([iw, id, -b - it]) {
				cylinder(h = h + t, r1 = t, r2 = t, $fn = 36 + im);
			}
			translate([iw, id, -b - it]) {
				cube([t, t, h + t + im]);
			}
		}

		/* back face */
		difference() {
			translate([0, id, -b]) {
				cube([iw, t, h]);
			}
			translate([67.5 - (r/2), 42 + it, 1.5 - (r/2)]) {
				cube([10 + r, 12 + im, 6 + r]);
			}
			translate([52.2 - (r/2), 42 + it, 9.5 - (r/2)]) {
				cube([10 + r, 19 + im, 6 + r]);
			}
			translate([9.7 - (r/2), 42 + it, 9.5 - (r/2)]) {
				cube([10 + r, 19 + im, 6 + r]);
			}
		}

		/* bottom face */
		translate([0, -t, -b - it]) {
			cube([iw, id + 2*t, t + im]);
		}
	}

	translate([-.5, -.5, 0]) {
		cube([iw+1, id+1, h]);
	}

}

/* ledge */
difference() {
	translate([0, 0, -b]) {
		cube([iw, id, b]);
	}
	translate([l, l, -b]) {
		cube([iw - 2*l, id - 2*l, b]);
	}
}
