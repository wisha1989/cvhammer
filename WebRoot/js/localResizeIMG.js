    $.fn.localResizeIMG = function(obj) {
        this.on('change', function() {
            var file = this.files[0];
            var URL = window.URL || window.webkitURL;
            var blob = URL.createObjectURL(file);

            if(!/image\/\w+/.test(file.type)) {
              alert("请确保文件类型为图像类型");
              return false;
            }
            if ($.isFunction(obj.before)) {
                obj.before(this, blob, file)
            };

            _create(blob, file);
            this.value = ''; 
        });


        function _create(blob,file) {
            var img = new Image();
            img.src = blob;

            img.onload = function() {
                var that = this;

  
                var w = that.width,
                    h = that.height,
                    scale = w / h;
                if(obj.width<that.width)
                	{
                	w = obj.width;
                	}
                w = obj.width || w;
                h = w / scale;

                //鐢熸垚canvas
                var canvas = document.createElement('canvas');
                var ctx = canvas.getContext('2d');
                $(canvas).attr({
                    width: w,
                    height: h
                });
                ctx.drawImage(that, 0, 0, w, h);
                var base64 = canvas.toDataURL('image/jpeg', obj.quality || 0.8);
                var result = {
                    base64: base64,
                    clearBase64: base64.substr(base64.indexOf(',') + 1)
                };
                regimgname = /^[a-zA-Z0-9.-_]$/;
                if(regimgname.test(file.name.split(".")[length-1]))
            	{
                	imgname=file.name;
            	}else{
            		imgname="1"+"."+file.name.split(".")[length];
            	}
                obj.success(result);
                obj.name(imgname);
  
            };
        }
    };
