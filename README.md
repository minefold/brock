# Brock
[![Build Status](https://travis-ci.org/minefold/brock.png?branch=master)](https://travis-ci.org/minefold/brock)

Loads and dumps settings based on the [Minefold](https://minefold.com) Funpack schema format.

    schema = Brock::Schema.new([
      { name: 'mp_maxrounds',
        type: 'integer',
        description: 'Maximum number of rounds to play',
        default: 5
      }
    ])

    Brock::Settings.new(schema).load('mp_maxrounds' => '10')
    # => {'mp_maxrounds' => 10}

    Brock::Settings.new(schema).dump('mp_maxrounds' => '10')
    # => {'mp_maxrounds' => 10}


## License

The MIT License (MIT)
Copyright © 2013 Mütli Corp. <tech+brock@minefold.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
