// Pico size = 31.6mm x 12.5mm x 3.6mm
USBSIZE = 10.85;
TIPOFFSET = 10;
USBX = 31.6; //28.02 short,
USBY = 12.5;
USBZ = 3.6;
BLADEX=94.8; 
BLADEY=25;
BLADEZ=3.6;
module Transistor()
{

	transistorHalf();

	/*
	translate([0,2*BLADEY,0])
	{ transistorHalf(); }
	*/
	translate([0,0,BLADEZ])
	{ 
	rotate([180,0,0])
	{ transistorHalf(); }
	}

}
Transistor();

module transistorHalf()
{
	difference()
	{
		union()
		{
			blade();
			decor();
			hilt();
		}
		flashdrive();

	}


}
//transistorHalf();

module decor()//w/ triangle and circles
{

	translate([-(BLADEX/2),0, -(BLADEZ/2 + 2)])	// *>*=OE
	{
		cylinder(h=BLADEZ + 2, r = USBSIZE*2, $fn=3);
	}

	// >=*O*E

	translate([-(BLADEX/16),0,-.25])
	{
		cylinder(h=BLADEZ + .5, r = BLADEY/2, $fn=50, center=true);
	}
	translate([-(BLADEX/16),0,-.5])
	{
		cylinder(h=BLADEZ + .75, r = BLADEY/2.25, $fn=50, center=true);
	}
	translate([-(BLADEX/16),0,-.75])
	{
		cylinder(h=BLADEZ + 1, r = BLADEY/2.5, $fn=50, center=true);
	}


	translate([-BLADEX/4,0,-.25]) // >*=*OE
	{
		cube([BLADEX/2, BLADEY/3, BLADEZ +.5], center=true);
	}

	difference()// >=O*-*
	{
		union()
		{
			translate([0,0,-.25])
			{
				cube([BLADEX/2, BLADEY/4, BLADEZ +.5], center=true);
			}
			translate([BLADEX/4, 0, -.25])
			{
				cylinder(h=BLADEZ + .5, r = BLADEY/4, $fn=25, center=true);
			}
		}
		translate([BLADEX/4, 0, -.5])
		{
			cylinder(h=BLADEZ + .5, r = BLADEY/8, $fn=25, center=true);
		}
	}

	difference()// >=O*_*
	{
		union()
		{
			translate([BLADEX/7.5,-BLADEY/3,-.25])
			{
				cube([BLADEX/2.5, BLADEY/8, BLADEZ +.5], center=true);
			}
			translate([BLADEX/2.9, -BLADEY/3.74,-.25])
			{
				rotate([0,0,45])
				{
					cube([BLADEX/16, BLADEY/8, BLADEZ +.5], center=true);
				}
			}
			translate([BLADEX/2.7, -BLADEY/7,-.25])
			{
				cylinder(h=BLADEZ + .5, r = BLADEY/7, $fn=25, center=true);
			}
		}
			translate([BLADEX/2.7, -BLADEY/7,-.5])
		{
			cylinder(h=BLADEZ + 1, r = BLADEY/12, $fn=25, center=true);
		}
	}

	difference()// >=O*^*
	{
		union()
		{
			translate([BLADEX/7,BLADEY/3,-.25])
			{
				cube([BLADEX/2, BLADEY/8, BLADEZ +.5], center=true);
			}
			translate([BLADEX/2.48, BLADEY/3.74,-.25])
			{
				rotate([0,0,-45])
				{
					cube([BLADEX/16, BLADEY/8, BLADEZ +.5], center=true);
				}
			}
			translate([BLADEX/2.35, BLADEY/8,-.25])
			{
				cylinder(h=BLADEZ + .5, r = BLADEY/6, $fn=25, center=true);
			}
		}
			translate([BLADEX/2.35,BLADEY/8,-.5])
		{
			cylinder(h=BLADEZ + 1, r = BLADEY/10, $fn=25, center=true);
		}
	}
}

module hilt()
{
	difference()
	{
		union()
		{
			translate([-BLADEX*1.25,0,BLADEZ/2])
			{
				rotate([0,90,0])
				{
					cylinder(h=BLADEX, r=BLADEZ/2, $fn=25);
				}
			}
			translate([-BLADEX*.9,0,BLADEZ/2])
			{
				rotate([0,90,0])
				{
					cylinder(h=BLADEX/10, r=BLADEZ, $fn=25);
				}
			}
			translate([-BLADEX*1.2,0,BLADEZ/2])
			{
				rotate([0,90,0])
				{
					cylinder(h=BLADEX/7, r=BLADEZ*1.5, $fn=25);
				}
			}
			translate([-BLADEX*1.25,0,BLADEZ/2])
			{
				rotate([0,90,0])
				{
					cylinder(h=BLADEX/10, r=BLADEZ, $fn=25);
				}
			}
		}

		//make it half
		translate([0,0,BLADEZ*1.5])
		{
			cube([3*BLADEX, BLADEY, 2*BLADEZ],center=true);
		}
	}
}

module rails()
{
		/*rails accept:
			outer slats: 
		*/
		translate([(BLADEX/2) - TIPOFFSET - USBSIZE/2,(BLADEY/2) - .5, BLADEZ/2]) //right Outer Rail
		{	
			cube([USBSIZE*2,4,2],center=true); 
		}
		translate([(BLADEX/2) - TIPOFFSET - USBSIZE/2,-(BLADEY/2) + .5, BLADEZ/2]) //left Outer Rail
		{	
			cube([USBSIZE*2,4,2],center=true); 
		}
		
		translate([(BLADEX/2) - TIPOFFSET - USBSIZE/2, (BLADEY/2) - 2,BLADEZ/2 - 1]) //right Inner Rail
		{
			cube([USBSIZE*2 + 2,2,2.1],center=true);
		}
		translate([(BLADEX/2) - TIPOFFSET - USBSIZE/2, -(BLADEY/2) + 2,BLADEZ/2 - 1]) //left Inner Rail
		{
			cube([USBSIZE*2 + 2,2,2.1],center=true);
		}
}

module sides()
{
		difference()
		{
			union()
			{
				translate([BLADEX/3.25,BLADEY/2,0])
				{
					cube([BLADEX/2.5,BLADEY/2,BLADEZ],center=true);
				}
				translate([BLADEX/3.25,-BLADEY/2,0])
				{
					cube([BLADEX/2.5,BLADEY/2,BLADEZ],center=true);
				}
			}


//--------------------------------------------
			rotate([12,0,0])
			{
				translate([BLADEX/3.25,BLADEY/1.6,-BLADEZ*1.6])
				{
					cube([BLADEX/2.5,BLADEY/2,BLADEZ],center=true);
				}
			}
			rotate([-12,0,0])
			{
				translate([BLADEX/3.25,-BLADEY/1.6,-BLADEZ*1.6])
				{
					cube([BLADEX/2.5,BLADEY/2,BLADEZ],center=true);
				}
			}


			translate([BLADEX/3.25,-BLADEY/1.6,-BLADEZ/2])
			{
				cube([BLADEX/2.5, BLADEY/24 ,BLADEZ],center=true);
			}
			translate([BLADEX/3.25,BLADEY/1.6,-BLADEZ/2])
			{
				cube([BLADEX/2.5, BLADEY/24 ,BLADEZ],center=true);
			}
			translate([BLADEX/3.25,-BLADEY/2,-BLADEZ/2])
			{
				cube([BLADEX/2.5, BLADEY/24 ,BLADEZ],center=true);
			}			
			translate([BLADEX/3.25,BLADEY/2,-BLADEZ/2])
			{
				cube([BLADEX/2.5, BLADEY/24 ,BLADEZ],center=true);
			}



			translate([BLADEX/24,BLADEY/2,0])
			{
				rotate([0,0,30])
				{
					cylinder(h=BLADEZ + .75, r = USBSIZE*1.25, $fn=3, center=true);
				}
			}
			translate([BLADEX/24,-BLADEY/2,0])
			{
				rotate([0,0,-30])
				{
					cylinder(h=BLADEZ + .75, r = USBSIZE*1.25, $fn=3, center=true);
				}
			}
		}

}

module blade()	// w/ groves to hold the tip
{
	difference()
	{
		union()
		{
			cube([BLADEX, BLADEY, BLADEZ],center=true);	// base polygon
			
			//rails();
	
			sides();

			//teeth
			translate([BLADEX/2,0,-BLADEZ/4])
			{ cube([BLADEZ,BLADEZ/1.5,BLADEZ],center=true); }
			translate([BLADEX/2,-BLADEY/6,-BLADEZ/4])
			{ cube([BLADEZ,BLADEZ/1.5,BLADEZ],center=true); }
			translate([BLADEX/2,BLADEY/6,-BLADEZ/4])
			{ cube([BLADEZ,BLADEZ/1.5,BLADEZ],center=true); }
		}//union
//----------------------------------------
		translate([BLADEX/2 + BLADEX/18,BLADEY/2,0])
		{
			rotate([0,0,30])
			{
				cylinder(h=BLADEZ + .75, r = USBSIZE*1.25, $fn=3, center=true);
			}
		}
		translate([BLADEX/2 + BLADEX/18,-BLADEY/2,0])
		{
			rotate([0,0,-30])
			{
				cylinder(h=BLADEZ + .75, r = USBSIZE*1.25, $fn=3, center=true);
			}
		}
		difference()
		{
			translate([-(BLADEX/16),0,-BLADEZ/1.75])
			{
				cylinder(h=BLADEZ/2.5, r = BLADEY/1.75, $fn=50, center=true);
			}
			translate([-(BLADEX/16),0,-BLADEZ/1.75])
			{
				cylinder(h=BLADEZ + .5, r = BLADEY/2, $fn=50, center=true);
			}
		}
	}//difference

}
//blade();

module tip()	// will slide from out position to in position when inserting
{

}

module flashdrive()
{
	//move the slot to the front of the blade
	translate([BLADEX/2 - USBX/2,0,USBZ/2])
	{
		// we want the usable end to stick out
		translate([USBSIZE,0,0]) 
		{ 
			cube([USBX,USBY,USBZ], center= true); 
		}
	}
}
//flashdrive();

module debug()
{
	difference()
	{
		blade();
		flashdrive();
	}
	decor();
	hilt();

	flashdrive();

}
//debug();
