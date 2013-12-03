convert -version

convert octocat.png -resize '70x70^' -gravity center -crop '70x70+0+0' -quantize GRAY -colors 256 -contrast source.png

composite stamp_overlay.png source.png source.png

convert -size 70x70 canvas:red \( octocat.png -resize '70x70^' -gravity center -crop '70x70+0+0' -quantize GRAY -colors 256 -contrast stamp_overlay.png -composite -negate \) -compose copy-opacity -composite stamp.png

gem install rmagick



