postmessagefuzzer
=================

window.postMessage Fuzzer POC


## Description ##

This tool provides basic functionality for fuzzing an application's implementation of cross-document messaging.
It attempts to identify applications that insert messages directly into the DOM without validating the origin or sanitizing the message.
It starts by spidering an application to compile a list of pages. It then sets an ```iframe``` to point to each of the pages discovered during spidering and attempts to send a message to this frame that includes an XSS. The payload in the XSS posts back to the utility. Currently nothing is done with this value.

## Usage ##

This is a Sinatra app and has only been tested with Ruby 2.0, though it should work for other versions as well.

### To start the tool ###
```bash
bundle install
ruby fuzzer.rb # => starts Sinatra app
```

### To use the tool ###
Provide a URL for spidering. If you want to try the sample code, point it at ```localhost:<port>/example/index.html```
