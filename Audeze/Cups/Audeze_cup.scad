module AudezeCup()
{

	difference()
	{
		smallCup();
		union()
		{
			screwHoles();
			screwRetainers();
		}
		bands();
		translate([0,0,-175])//-175])
		{
			sphere(r=181,$fn=50);
		}
	}	

}
AudezeCup();

/*
for i in [0,height]
projection(cut=true) translate([0, 0, -(height)]) 
{
	AudezeCup();
};
writeToDXF();
*/

module smallCup()
{
	intersection()
	{
		translate([0,0,-40])
		{
			sphere(r=66.47,$fn=50);
		}
		cylinder(r=53,h=53,$fn=50);
	}

}

module largeCup()
{
	intersection()
	{
		translate([0,0,-42])
		{
			sphere(r=70,$fn=100);
		}
		cylinder(r=56,h=53,$fn=100);
	}

}

module screwRetainers()
{
	translate([-34.5,-34.5,.75])
	{
		cylinder(h=60,r=2.55,$fn=40);
	}
	translate([34.5,-34.5,.75])
	{
		cylinder(h=60,r=2.55,$fn=40);
	}	
	translate([34.5,34.5,.75])
	{
		cylinder(h=60,r=2.55,$fn=40);
	}	
	translate([-34.5,34.5,.75])
	{
		cylinder(h=60,r=2.55,$fn=40);
	}
}

module screwHoles()
{
	translate([-34.5,-34.5,-1])
	{
		cylinder(h=60,r=1.5,$fn=40);
	}
	translate([34.5,-34.5,-1])
	{
		cylinder(h=60,r=1.5,$fn=40);
	}	
	translate([34.5,34.5,-1])
	{
		cylinder(h=60,r=1.5,$fn=40);
	}	
	translate([-34.5,34.5,-1])
	{
		cylinder(h=60,r=1.5,$fn=40);
	}
}


module bands()
{
	//first band at +46, last at -46

	intersection()
	{
		cylinder(r=46,h=40,$fn=50);
		difference()
		{
			smallCup();
			
			cylinder(r=46,h=1,$fn=50);

			translate([0,0,-1])
			{
				scale(.85) 
					{ smallCup(); }
			}
			intersection()
			{
				cylinder(r=46,h=40,$fn=50);
				translate([0,-3.6,-.001]) 
				{ 
					for (i=[0:18])
					{
						translate( [-46,46 - (4.8*i),0] ) { cube( [92,2.6,40] ); }
					}
					rotate([0,0,75])
					{
						translate( [-46,14,-.001] )
						{
							cube( [92,2.4,40] );
						}
					}
					rotate([0,0,-75])
					{
						translate( [-46,14,-.001] )
						{
							cube( [92,2.4,40] );
						}
					}
				}
			
			}
		}
	}

}
//bands();

///////////
// NOTES //
///////////
/*
small cup D = 102.64
large cup D (w/ overhang) = 112

screw D = 4.8 -> 5 mm
screw displacement = h=69.12, v=69.16

edge to first/last band: 7

*/