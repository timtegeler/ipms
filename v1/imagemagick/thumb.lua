local size = ngx.var.size
local format = ngx.var.format
ngx.req.read_body()  -- explicitly read the req body
local data = ngx.req.get_body_data()
if data then
	local magick = require "magick"
	local img = assert(magick.load_image_from_blob(data))
	img:thumb(size)
	img:set_format(format)
	ngx.say(img:get_blob())
        img:destroy()
	return
end
