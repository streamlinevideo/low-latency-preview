## Streamline Low Latency DASH preview

This is a proof of concept of generating a low latency live stream from encoder, to server, to player using entirely open source software end to end. It will later form the basis of an update to the larger streamline project as part of a larger update called Streamline Prime. https://github.com/streamlinevideo/streamline

Things to know.

- This demo provides everything you need to ruin a low latency live stream for educational purpouses.
- Don't try to run this in production without a lot of testing. I promise you it will explode. This has not been heavily tested.
- This is a preview and proof of concept. It is not meant to be used in production. There has not been extensive testing yet. There are bugs. I promise you, there are bugs ;).
- This demo only supports Ubuntu/Debian and MacOS


TODO for preview project

- Add ABR once it's fixed in DASH.js

If you are interested in the streamline prime project, check out this discussion. https://github.com/streamlinevideo/streamline/issues/13


# Building in Ubuntu / Debian:

Run...

    wget https://codeload.github.com/streamlinevideo/low-latency-preview/zip/master && unzip master && rm -r -f master/ && cd low-latency-preview-master/ && ./buildEncoderAndServerForUbuntu.sh    

You have now built everything. Continue to the run section.


# Building in MacOS:


First make sure you have homebrew installed. 


Run....

    curl -o master.zip https://codeload.github.com/streamlinevideo/low-latency-preview/zip/master && unzip master.zip && cd low-latency-preview-master/ && ./buildEncoderAndServerMacOS.sh
    

# Running the server
    

Run...

     sudo ./launchServer.sh


# Running the encoder

    ./launchEncoderTestPattern.sh 

The output will look like

    Oh 💩 here we go!
    View your stream at http://localhost:8080/ldashplay/1234/manifest.mpd

Go to the URL which it prints and you should see your stream!


If you would like to stream to a remote server that you have set up, use use the first argument to specify the hostname or IP address. You can also specify the second argument to create a stream name. 

Example....

    ./launchEncoderTestPattern.sh remoteserver.mydomain.com 1234

To kill the server and the encoder run...

    ./killAll.sh

You can modify the FFmpeg encoding settings to taste for resolution, inputs, etc.

We are using the dash.js player. Feel free to visit http://reference.dashif.org/dash.js/nightly/samples/dash-if-reference-player/index.html for their nightly referencep player or their github at https://github.com/Dash-Industry-Forum/dash.js/wiki.

