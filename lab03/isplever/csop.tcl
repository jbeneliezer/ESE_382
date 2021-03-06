
########## Tcl recorder starts at 02/19/20 10:16:35 ##########

set version "2.0"
set proj_dir "F:/lab03/lab03/isplever"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"gray_bin_csop.edf\" -jhd \"gray_bin_csop.jhd\" -err automake.err -log \"gray_bin_csop.log\" -prj csop -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@gray_bin_csop.esp\" -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/19/20 10:16:35 ###########


########## Tcl recorder starts at 02/19/20 10:17:03 ##########

# Commands to make the Process: 
# VHDL Post-Route Simulation Model
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"gray_bin_csop.edf\" -out \"gray_bin.bl0\" -err automake.err -log \"gray_bin_csop.log\" -prj csop -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@gray_bin_csop.esp\" -nbx -cvt YES"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" gray_bin.bl0 -o gray_bin.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj csop -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gray_bin.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"gray_bin.bl1\" -o \"csop.bl2\" -omod gray_bin -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" csop.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" csop.bl3 -pla -o csop.tt2 -dev p22v10gc -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" csop.tt2 -dev p22v10gc -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" csop.tt3 -dev p22v10gc -o csop.jed -ivec NoInput.tmv -rep csop.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open csop.psl w} rspFile] {
	puts stderr "Cannot create response file csop.psl: $rspFile"
} else {
	puts $rspFile "-dev p22v10gc -part LAT ispGAL22V10C-10LJ GAL -o csop.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @csop.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete csop.psl
if [catch {open csop._sp w} rspFile] {
	puts stderr "Cannot create response file csop._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route VHDL Simulation Models
#insert --
#unixpath $proj_dir
#vcom csop.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"csop._sp\" \"csop.vtd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete csop._sp
if [catch {open csop._sp w} rspFile] {
	puts stderr "Cannot create response file csop._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route VHDL Simulation Models
#insert #
#unixpath $proj_dir
#vcom csop.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"csop._sp\" \"csop.vatd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete csop._sp
if [runCmd "\"$cpld_bin/j2svhdl\" csop.jed -dly custom csop.tim max -pldbus default gray_bin.btp -o csop.vhq -module gray_bin -suppress -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/19/20 10:17:03 ###########


########## Tcl recorder starts at 02/19/20 10:18:26 ##########

# Commands to make the Process: 
# Pre-Fit Equations
if [runCmd "\"$cpld_bin/blif2eqn\" csop.tt2 -o csop.eq3 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/19/20 10:18:26 ###########


########## Tcl recorder starts at 02/19/20 10:18:36 ##########

# Commands to make the Process: 
# Post-Fit Equations
if [runCmd "\"$cpld_bin/blif2eqn\" csop.tt3 -o csop.eq4 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/19/20 10:18:37 ###########

