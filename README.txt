INSTALLATION

Run "sudo make install". This will install "nohups", "a" and "sudoa" commands
to /usr/local/bin.
Source nohups.sh within bashrc, to register completion callbacks for the new
commands.

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

