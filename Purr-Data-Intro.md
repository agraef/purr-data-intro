# Meet the Cat: A Quick Introduction to Purr Data

Albert Gräf <aggraef@gmail.com>  
Computer Music Dept., Institute of Art History and Musicology  
Johannes Gutenberg University (JGU) Mainz, Germany  
February 2017 (Version 2.0)

## What is Purr Data?

**Purr Data** is the latest version (2.0 at the time of this writing) of Ivica Ico Bukvic's **Pd-l2ork** (which we also refer to as Pd-l2ork 1.0 or "classic" Pd-l2ork when needed for the sake of clarity). Pd-l2ork in turn is a fork of Hans-Christoph Steiner's **Pd-extended**, which has been the longest-running (and arguably the most popular) variant of Miller Puckette's **Pd**. **Pd** a.k.a. "Pure Data", the common basis of all these variants, is Miller Puckette's interactive and graphical computer music and multimedia environment. It is often called "vanilla" Pd, because it comes without any extras and thus provides the purest taste of Pd, you might say. Pd is the premier open-source alternative to Cycling74's well-known commercial **Max** program (whose original version was also developed by Miller Puckette when he was at IRCAM in the 1980s). While there are a few other popular real-time applications in the realm of computer music and media art, most notably Csound and SuperCollider, Max and Pd are special in that the users work in a graphical "patching" environment which allows them to put together complex signal processing applications in an intuitive way without having to learn a "real" programming language.

While vanilla Pd remains critically important for the development of the real-time engine, its Tcl/Tk-based graphical user interface has never been very pretty or convenient. Consequently there have been various efforts by the community to improve Pd's GUI in various ways. Pd-extended is the earliest and the longest-running of these, which also includes a fairly complete selection of 3rd party add-ons. But it has not been updated since 2013 and has thus slowly started falling victim to bit-rot. It still runs on modern systems and is being used, but has some issues especially on 64 bit systems.

Ico Bukvic introduced **Pd-l2ork** in 2010 as a fork of Pd-extended to be used by the "Linux Laptop Orchestra" (L2Ork) he founded at the School of Performing Arts at Virginia Tech. Although the original motivation was to create an improved version of Pd-extended to be used by the L2Ork (hence the name) as well as in education, on Linux it quickly became a more up-to-date alternative to Pd-extended offering a fair number of additional bug fixes and GUI improvements.

Despite the many and substantial improvements it offers, Pd-l2ork's GUI is still based on Tcl/Tk. This is both good and bad. The major advantage is compatibility with vanilla Pd. On the other hand, Tcl/Tk looks and feels outdated, even when going to some lengths with theming, as Pd-l2ork does. Tcl is a rather basic programming language, and its libraries have been falling behind, making it hard to integrate the latest GUI, multimedia and web technologies. But most importantly, Pd-l2ork's adoption was seriously hampered by the fact that it relies on some Tcl/Tk extensions which are not available on non-Linux platforms, which means that it wouldn't run on Windows or the Mac without serious efforts.

In 2015 Jonathan Wilkes stepped in and started creating **Purr Data** to address these problems. In a nutshell, Purr Data is Pd-l2ork with the Tcl/Tk GUI part ripped out and replaced with modern web technology. It uses nw.js a.k.a. "node-webkit", which is essentially a stand-alone web browser engine combined with a JavaScript runtime. This has the advantage of being cross-platform, so that Purr Data also runs on Mac and Windows systems. It also makes it possible to leverage standard web technologies such as JavaScript and HTML5 which are much more widespread and have better support than Tcl/Tk these days.

Consequently, Purr Data's GUI is written entirely in JavaScript. Patches are implemented as SVG documents which are generally much more responsive and offer better graphical capabilities than Tk windows. They can also be themed using CSS and zoomed like any browser window, improving usability. These features alone make the switch to Purr Data worthwhile. Purr Data also looks better and is easier on the eyes than Pd-l2ork, let alone vanilla Pd, especially on high-dpi displays.

(Screenie of Purr Data)

Purr Data's nw.js GUI also has some disadvantages. Most notably, some of the included externals still rely on Tcl code, so their GUI features will not work in Purr Data until they get ported to the new GUI written in JavaScript. Second, the size of the binary packages is much larger than with Pd-l2ork or Pd-extended since, in order to make the packages self-contained, they also include the full nw.js binary distribution. The package size shouldn't be a major concern in most cases, however, and the remaining issues with the externals will be ironed out over time.

In other words, even though Purr Data is still comparatively young, it is ready for day-to-day use by newcomers and seasoned Pd users right now!

## The Name?

To quote Jonathan from his initial announcement on the [Pd forum][]:

> I've nicknamed it "Purr Data", because cats.

[Pd forum]: http://forum.pdpatchrepo.info/topic/9956/gui-port-of-pd-l2ork-alpha-0-release

Quite obviously the name is a play on "Pure Data" on which "Purr Data" is ultimately based. It also raises positive connotations of soothing purring sounds. Note that "Purr Data" is just a nick-name for the Pd-l2ork 2.x branch. The executable, library directory etc. are all still named pd-l2ork in the new version.

## Where to Get It

Jonathan Wilkes maintains the Purr Data sources in GitLab at <https://git.purrdata.net/jwilkes/purr-data>. The latest packages for Linux (Debian, Raspbian, Ubuntu), OSX and Windows are available at <https://git.purrdata.net/jwilkes/purr-data-binaries/tree/master>.

At JGU we also maintain a collection of Linux packages for Arch Linux (via the Arch User Repositories a.k.a. AUR) and Ubuntu 14.04/16.04 (via Launchpad). More information about these can be found at <http://l2orkaur.bitbucket.org/> (Arch) and <http://l2orkubuntu.bitbucket.org/> (Ubuntu). Besides Purr Data, these repositories also contain the "classic" Pd-l2ork (Ico Bukvic's 1.0 version), as well as two additional programming extensions for Pd which enable you to run Faust and Pure externals in Pd-l2ork and Purr Data. The JGU packages also offer the advantage that they let you install both classic Pd-l2ork and Purr Data on the same system.

Unless your system isn't officially supported or you have specific requirements forcing you to compile from source, we recommend using the available binaries. Because of the large number of included externals, Purr Data's build process is rather involved, requires a lot of 3rd party dependencies, and takes quite a while even on modern high-end hardware.

## Getting Started

Once you've installed Purr Data, you can launch it from the command line or the desktop environment as usual. On Linux, you can either run `pd-l2ork` from the shell, or look in your desktop environment's program menu or launcher for the `Pd-l2ork` entry and click on that. (Note that when using the JGU packages, Purr Data gets launched using the `purr-data` command, which is a symbolic link to `/opt/purr-data/bin/pd-l2ork`. Likewise, the desktop launchers are named `Purr-Data` instead.)

You can also invoke the `pd-l2ork` executable with some Pd patch files as command line parameters, or click on Pd patches in your file manager to have Purr Data open them (this will usually require a first-time setup to tell the file manager that the Pd file type should be opened using the Purr Data application). Purr Data should then open its main "console" window which logs all messages from the program. If you loaded any patch files, these will be shown in separate "canvas" windows.

Purr Data understands basically the same set of command line options as vanilla Pd or Pd-l2ork. You can find out about these by running `pd-l2ork -help` (`purr-data -help` when using the JGU packages) from the command line.

**NOTE:** Like Pd-l2ork, but unlike vanilla Pd, Purr Data always runs as a *single application instance*. If you load additional patch files (by invoking the `pd-l2ork` executable or by clicking patch files in the file manager), they will be opened as new canvas windows in that single unique instance. This prevents the kind of confusion which often arises with vanilla Pd if you accidentally open different patches in different instances of the application. To have different patches communicate transparently with each other, and to make it possible to copy and paste objects between them, they *must* run in the same program instance, and Purr Data makes sure that this is always the case. (At present, this also means that Purr Data's real-time processing is all done in a single process. In the future, it will also become possible to run different patches on different instances of the real-time engine in order to leverage multi-processing capabilities on modern multi-core systems, but this hasn't been implemented yet.)

## Configuration

When you launch Purr Data for the first time, most likely you will have to configure some things, such as the audio and MIDI devices that you want to use. Like Pd-l2ork, Purr Data provides a central "Preferences" dialog which lets you do this in a convenient way.

### Audio and MIDI Devices

The following screenshot shows how the "Audio" and "MIDI" tabs in this dialog look like on the Mac.

(Screenies of Audio and MIDI tab)

For most purposes it should be sufficient to just select the audio and MIDI inputs and outputs that you want to use from the corresponding dropdown lists. This can be redone at any time if needed. Note that it is usually possible to select multiple input and output devices, but this depends on the platform and the selected audio/MIDI back-end or "API". Also note that on Linux (using the ALSA API), the MIDI tab will only allow you to set the number of ALSA MIDI input/output ports to be created; you then still have to use a MIDI patchbay program such as qjackctl to connect these ports to the hardware devices as needed.

Another common pitfall for beginners is that, due to limitations in the Pd engine, if you connect new external audio or MIDI devices while Purr Data is already running, they will only show up in the preferences after relaunching Purr Data.

### GUI and Startup Options

The GUI theme can be selected on the "GUI" tab (see the screenshot below). Purr Data provides various different GUI themes out of the box. Note that the GUI themes are in fact just CSS files in Purr Data's library directory, so you can easily change them or create your own.

Another useful option on the GUI tab is "save/load zoom level with patch". Purr Data can zoom any patch window to 16 different levels, and this option, when enabled, allows you to store the current zoom level when a patch is saved, and then later restore the zoom level when the patch gets reloaded.

(Screenies of the GUI and Startup tabs)

The final tab in the preferences dialog is the "Startup" tab, which lets you edit the lists of library paths and startup libraries, as well as the additional options the program is to be invoked with. By default, Purr Data loads most bundled external libraries at startup and adds the corresponding directories to its library search path. If you don't need all of these, you can remove individual search paths and/or libraries using the "Search Paths" and "Libraries" lists on the Startup tab. Just click on a search path or library and click the `Delete` button. It is also possible to select an item and add your own search paths and external libraries with the `New` button, or change an existing entry with the `Edit` button.

At the bottom of the Startup tab there is a "Startup Flags" field which lets you specify which additional options the program should be invoked with. This is commonly used to add options like `-legacy` (which enforces bug compatibility with vanilla Pd) as well as the `-path` and `-lib` options which provide an alternative way to add search paths and external libraries. For instance, to add JGU's Pure and Faust extensions to the startup libraries, the Startup Flags field may contain something like the following: 

```
-path /opt/local/lib/pd/extra -lib pure -lib faust/pdfaust
```

(Note that on the Mac the Pure and Faust extensions are often installed from MacPorts, this is why we added the search path in the above example. On Linux the `-path` option wouldn't be needed.)

Any desired startup options can be set that way, i.e., anything that Pd usually accepts on the command line. However, note that the startup flags require that you relaunch Purr Data for the options to take effect (the same is true if you change the list of startup libraries). Another common pitfall is that options in the startup flags may override any manual changes done on the lists of search paths and external libraries once you relaunch Purr Data. E.g., if a library gets loaded via a `-lib` option in the startup flags, it will *also* show up in the list of libraries after relaunching Purr Data. Thus you'll have to remove *both* the corresponding entry in the libraries list *and* the corresponding `-lib` option to completely get rid of it.

Finally, note that if your configuration gets seriously messed up, there are ways to reset Purr Data to its default configuration, see the "Tips and Tricks" section below.

## Getting Help

The best way for new users to learn how to use Purr Data, and Pd in general, is its excellent integrated help system. This is really one of the exceptionally strong points of the Pd program, no matter which flavor you use. The help system consists of hundreds of help patches covering many different areas, and these help patches are not just documentation, they are *real* Pd patches which you can run to try them out, and then copy and paste relevant parts to your own patches.

Purr Data, like Pd-l2ork, continues to build on the Pd-extended documentation efforts. This includes over 200 new and updated help files, including the cyclone library documentation. All of the new help files provide supporting meta info contained within the META subpatch (which is needed, in particular, to enable keyword searches), following the standards set by the Pd documentation project (PDDP). This is an ongoing effort, however, and so not all help patches have been converted yet.

While the sheer amount of help patches can be overwhelming at first, there are some sections in the documentation which are organized as tutorials, so that you can work through them step by step. This includes all the help patches that go along with Miller Puckette's comprehensive book ["Theory and Techniques of Electronic Music"](http://msp.ucsd.edu/techniques.htm), which are still the best way to get to grips with Pd. If you are new to Pd, we recommend that you work at least through the sections "Control Tutorials" and "Audio Tutorials", and *really* try to understand what's going on in these patches. With a complex software like Pd, it's all too easy to fall victim to "cargo cult" habits if you just blindly copy parts of other people's patches. You should resist that temptation, at least until you have a solid foundation under your belt, and those two sections will provide you with that.

Purr Data's central point of entry to the help system is its *Help Browser*, discussed below. In addition, as with other Pd flavors, it is also possible to open the help patch for an object by just right-clicking on that object in a patch and choosing the "Help" menu item. 

### The Help Browser

Using the Help / Help Browser menu option (shortcut: ctrl + B, or cmd + B on the Mac) fires up Purr Data's help browser, which looks deceptively simple (see the screenshot below) and is actually quite easy to use, but offers a lot of functionality under the hood. You can search for object names or keywords by typing them in the search entry field at the top of the browser, or you can browse the available documentation sections in the browser's *home screen*, which is what gets shown initially below the search entry, by just clicking on one of the section titles.

(Screenie: Help Browser)

On the right in the figure you can see how the display changes after you entered a search term like "audio devices" and hit Enter. All related help patches will be shown in the list (with short descriptions of the help patches if available). You can then click on one of the help patches to open it in a canvas window. Clicking on the "x" symbol in the search entry returns you to the home screen.

Note that to keep things simple and not to overwhelm novice users with too much information right up front, the search function only covers the "official" documentation (the doc/ hierarchy). Also, the home screen, in addition to the standard Pd documentation sections, only offers a few tutorials from the PDDP (Pd documentation project) and a selected few important external libraries, such as Cyclone and Gem (note that Gem, Pd's OpenGL-based 3D rendering library, isn't available on the Mac right now, so this section won't be displayed there).

To explore all the other help patches which are available in the extra/ hierarchy (which contains all the 3rd party abstractions and externals), you must employ the little folder icon to the right of the search entry. This will open a file browser (initially on the doc/ folder) which can then be used to browse *all* the available help patches. When looking for help patches in the extra/ hierarchy, which is a sibling of doc/, simply point the file browser to that directory and click on one of its subdirectories containing the various abstractions and externals. Clicking on a help patch and clicking `Open` will open the patch in its own window, and then also show the corresponding directory in the browser, so that additional help patches from the same folder can be accessed without any further ado.

If you already know the name of a subdirectory with interesting help patches, you can also just type its name in the search entry (including the doc/ or extra/ prefix) to have the corresponding folder displayed in the help browser. For instance, typing `extra/mrpeach` and Enter provides a quick way to access the help patches for the "mrpeach" externals. (In the future, it will hopefully become possible to "pin" your favorite directories to the home screen of the help browser, so that you don't have to remember their names.)

Note that in any case, you can always return to the home screen of the help browser by clicking that tiny "x" symbol in the search entry (or by just hitting Enter in the field if it is empty).

## Tips and Tricks

We conclude this primer with a little grab bag of helpful tips and tricks. If your questions aren't answered here, please post them to the DISIS [Pd-l2ork mailing list](http://disis.music.vt.edu/listinfo/l2ork-dev). Questions (and answers) which are of interest to all Purr Data users will likely be added to this section in the future. 

### Legacy Tcl commands in externals

Every so often you may run into warnings about "legacy Tcl commands" in Purr Data's console window which typically look like this:

~~~
legacy tcl command at 201 of ../shared/hammer/file.c: hammereditor_close .86439b0 0
~~~

In most cases these should be harmless, but they may indicate a missing piece of GUI functionality due to Tcl code which has not been ported to Purr Data's new nw.js GUI yet. In any case, feel free to report such messages at Purr Data's [issue tracker](https://git.purrdata.net/jwilkes/purr-data/issues), so that hopefully someone from the development team can look into them. A proper bug report should at least include the message itself and the Pd object it relates to. If some special steps are needed to reproduce the message, you should report these as well. Also, please do make sure *first* that the specific message you're seeing has not been reported in the issue tracker already.

### Pd-l2ork and Purr Data goodies

Compared to vanilla Pd, Pd-l2ork and Purr Data provide a comprehensive set of new and improved features, way too many to even just mention them all, so we refer the interested reader to the [PdCon 2016 paper](http://ico.bukvic.net/PDF/PdCon16_paper_84.pdf) for details. The PdCon paper also has a detailed account on the history and motivation of the Pd-l2ork project.

Many of the new features are simply GUI and usability improvements which, if done right (which we think they are), quickly become second nature to the user, so that they aren't even consciously noticed any more. This certainly includes Pd-l2ork's *infinite undo* capability which makes it easy to revert accidental changes without having to worry about taking snapshots of patches while they're under development. Another feature worth mentioning here is the improved *tidy up* option in the Edit menu, which first aligns objects and then spaces them equidistantly.

Another big time-saver is Pd-l2ork's *intelligent patching* facility, which lets you select two or more objects in order to connect multiple outlets and inlets in one go. Intelligent patching offers a number of different modes, the most useful (or at least the easiest) of these are:

- If you select *exactly* two objects A and B, say, and then connect one of the outlets from A to one the inlets of B, then beginning with the prescribed outlet-inlet pair the remaining outlets of A will be connected to the corresponding inlets of B automagically.

- If you select two (or more) objects B and C, say, and then connect an outlet of a third, unselected object A to an inlet of B, then the corresponding connection from A to C will be done automatically. Conversely, you can also connect an outlet of B to an inlet of A to have the corresponding C-A connection completed for you.

- Also, pressing the shift key while doing connections will let you do multiple connections from the same outlet in one go.

It is worth practicing these so that you can amaze your vanilla-running friends with the speed at which you can construct rather complicated patches using these shortcuts. Unfortunately, at present neither Pd-l2ork nor Purr Data supplements this incredibly useful facility with a help patch, so I have provided an [intelligent-patching.pd](intelligent-patching.pd) patch with this primer for your amusement. In the comments, the patch also includes detailed explanations of all the different intelligent patching modes for your perusal.

Other features will be more useful for advanced users, like the reflection capabilities (see the `pdinfo`, `canvasinfo`, `classinfo` and `objectinfo` help patches) and the new SVG graphics for data structure visualizations. The latter have been considerably enhanced in Purr Data, see the "Pd-L2Ork Data Structures" section in the help browser.

### Install classic Pd-l2ork alongside Purr Data

On Linux there are some situations where you may want to run *both* classic Pd-l2ork and Purr Data on the same system. This may be useful, e.g., if you need some feature of Pd-l2ork like its K12 mode which hasn't been ported to Purr Data yet. In order to do this, you need one of the JGU packages of Purr Data (see "Where to Get It" above). These will install into a separate directory (normally `/opt/purr-data`) so that the pathnames of the binaries and libraries in the package do not clash with those from a classic Pd-l2ork installation under `/usr`. The desktop icons will be named differently as well, and a symbolic link named `purr-data` will be created in the `/usr/bin` directory. The link points to `/opt/purr-data/bin/pd-l2ork` and lets you run Purr Data from the command line without having to specify the full path to the executable. Last but not least, the JGU packages have also been patched up so that they use a separate `.purr-data` configuration directory in your home directory instead of Pd-l2ork's `.pd-l2ork` folder, so that the two programs can happily coexist.

### Resetting the preferences

It happens to the best of us that we mess up our Pd configuration so badly that it is beyond repair. In such a case you probably want to go back to Purr Data's default setup and start from a clean slate again. Unfortunately, Purr Data's preferences dialog does not provide a button for this (yet), but there are ways to accomplish this. They depend on the particular platform, however.

- On Linux, do `rm -rf ~/.pd-l2ork` in the terminal (`rm -rf ~/.purr-data` when using the JGU packages).

- On the Mac, do `rm ~/Library/Preferences/org.puredata.pd-l2ork.plist` in the terminal.

- On Windows, launch the `regedit` program and look for the registry key `HKEY_CURRENT_USER\Software\Purr-Data` or `HKEY_LOCAL_MACHINE\Software\Purr-Data`. Delete that key and all its subkeys.

Then just relaunch Purr Data. Your preferences should now be in pristine state again, and all the default search paths and startup libraries will be restored. Of course, you will then have to reconfigure your audio and MIDI devices as needed.
