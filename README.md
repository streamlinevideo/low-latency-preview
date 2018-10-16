## Streamline Low Latency DASH preview

This is a proof of concept of generating a low latency live stream from encoder, to server, to player using entirely open source software end to end.

It will later form the basis of an update to the larger streamline project. https://github.com/streamlinevideo/streamline

Things to know.

- This demo assumes that you are using Ubuntu / Debian
- This demo provides everything you need to ruin a low latency live stream for educational purpouses.
- This is a preview and proof of concept. It is not meant to be used in production. There has not been extensive testing yet. There are bugs. I promise you, there are bugs ;).

TODO for preview project

- OSX directions and scripts
- Maybe Windows directions and scripts
- Polish server performance and reliability

If you are interested in the streamline prime project, check out this discussion. https://github.com/streamlinevideo/streamline/issues/13

Directions:

Boot into Ubuntu

Run...

    git clone https://github.com/colleenkhenry/low-latency-preview.git

Run... 

    cd low-latency-preview

Run..

    ./buildEncoderAndServerForUbuntu.sh

You have now built everything.

To run the server

Run..

     sudo ./launchServer.sh

To run the encoder

    ./launchEncoderTestPattern.sh *insert destination hostname of server* *insert a stream name*

Example: 

    ./launchEncoderTestPattern.sh localhost 1234

The output will look like

    Oh 💩 here we go!
    View your stream at http://localhost:8080/ldash/play/1234/manifest.mpd

Go to the URL which it prints and you should see your stream!

To kill the streams

    ./killAll.sh

You can modify the FFmpeg encoding settings to taste for resolution, inputs, etc.

We are using the dash.js player. Feel free to visit http://reference.dashif.org/dash.js/nightly/samples/dash-if-reference-player/index.html for their nightly referencep player or their github at https://github.com/Dash-Industry-Forum/dash.js/wiki.

Help wanted :)

If you can figure out why there is a gap between segments in download time, we'd really appreciate a patch!
