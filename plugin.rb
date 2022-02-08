#!/bin/env ruby
# encoding: utf-8
# name: PINGPOD Replay Onebox
# version: 0.1
# authors: PINGPOD Inc.

require "onebox"

class Onebox::Engine::PingpodReplayOnebox
  include Onebox::Engine

  def self.priority
    0
  end

  REGEX = /^https?:\/\/app\.pingpod\.com\/replay\/([0-9a-zA-Z]+)$/

  matches_regexp REGEX

  def id
    @url.match(REGEX)[1]
  end

  def url
    "https://app.pingpod.com/replay/#{id}"
  end

  def to_html
    <<HTML
    <div class="onebox-pingpod-replay">
      <div class="replay-video-container">
        <video width="100%" controls>
          <source src="https://stream.mux.com/#{id}/high.mp4" type="video/mp4" />
        </video>
      </div>
    </div>
HTML
  end
end