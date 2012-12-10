INSTALLATION

Put "nohups" somewhere on your path.
Source nohups.sh within bashrc.
This will register two new bash functions: "a" and "sudoa" (both implemented
in terms of the "nohups" script).
It will also register completion callbacks for the shell so that it respects
their semantics.

USAGE

nohups gedit filename.txt => opens a gedit as the current user
a gedit filename.txt => same as using nohups
sudoa gedit filename.txt => opens a gedit as root (using sudo)

* commands will open in the background
* commands will not die when the terminal closes
* they will not be listed as jobs; instead, the process id is printed to
  stdout
* with "nohups" or "a", output goes to .out and .err files within
  $HOME/.nohups.d/
* with "sudoa", output goes to .out and .err files within /root/.nohups.d/

