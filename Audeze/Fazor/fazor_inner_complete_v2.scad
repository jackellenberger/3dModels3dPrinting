module fazor1piece()
{
	union()
	{
		difference() //upper and lower ring for holding pads
		{
			cylinder(h=3,r=53,$fn=100); //major shape
	
			translate([0,0,-.1]) //move lower ring down
			{
				difference() // get ring rather than circle
				{
					cylinder(h=2.1,r=53.1,$fn=100);
					cylinder(h=2.1,r=43,$fn=100);
				}
			}
			translate([-31,-22,-.1])
			{
				cube([66,44,5.1]);
			}
			translate([-30,-45,-.1])
			{
				rotate([0,0,-60])
				{
					cube([2,12,4]);
				}
			}
		}
		fazorStructure();
	}
}
//fazor1piece();

module fazor2piece()
{
	translate([0,-100,0])
	{
		fazor2pieceTop();
	}
	fazor2pieceBottom();

}
fazor2piece();

module fazor2pieceTop()
{
	difference()
	{
		cylinder(h=2,r=53,$fn=100); //major shape
		translate([-31,-22,-.1])
		{
			cube([66,44,5.1]);
		}
	}
}
//fazor2pieceTop();

module fazor2pieceBottom()
{
	union()
	{
		difference()
		{
			cylinder(h=2,r=43,$fn=100); //major shape
			translate([-31,-22,-.1])
			{
				cube([66,44,5.1]);
			}
		}
		fazorStructure();
		
	}
}
//fazor2pieceBottom();

module fazorBar()
{
	union()
	{
		difference()
		{
			translate([-2.5,23,0])
			{
				rotate([90,0,0])
				{
					equilateralTriangle(side=5,height=46);
				}
			}
			translate([-.65,-24,-.1])
			{
				cube([1.3,48,1.3]);
			}
		}
		translate([-.65,-23,0])
		{
			cube([1.3,3,.2]);
		}
		translate([-.65,19,0])
		{
			cube([1.3,3,.2]);
		}
		translate([-.65,-2,0])
		{
			cube([1.3,4,.2]);
		}
	}

}
//fazorBar();


module fazorStructure()
{
	translate([-25,0,0])
	{
		for(i=[0:5]) //foreach fazor
		{
			translate([10*i,0,0])
			{
				fazorBar();
			}
		}
	}
}
//fazorStructure();













//LIBRARIES
module equilateralTriangle (side=10, height=10, center=false)
{
	translate(center==true ? [-side/2,-sqrt(3)*side/6,-height/2] : [0,0,0])	
		linear_extrude(height=height)
			polygon(points=[[0,0],[side,0],[side/2,sqrt(3)*side/2]]);
}













