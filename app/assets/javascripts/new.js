function previewFiles() {
    var preview_array = [];
    var file_array = [];
    var reader_array  = [];
    var file_length = document.querySelector('input[type=file]').files.length;
    for(var i=0; i<4; i++){
        document.querySelector('img[name="preview' + i + '"]').src = "";
    }
    for(var i=0; i<file_length; i++){
        preview_array.push(document.querySelector('img[name="preview' + i + '"]'));
        file_array.push(document.querySelector('input[type=file]').files[i]);
        reader_array.push(new FileReader());
    }
    //なぜかfor文回せない。
    // for(var j=0; j<file_length; j++){
    //   reader_array[j].addEventListener("load", function () {
    //     preview_array[j].src = reader_array[j].result;
    //   }, false);
    // }
    if(file_length>0){
        console.log("0");
        reader_array[0].addEventListener("load", function () {
            preview_array[0].src = reader_array[0].result;
        }, false);
    }

    if(file_length>1){
        console.log("1");
        reader_array[1].addEventListener("load", function () {
            preview_array[1].src = reader_array[1].result;
        }, false);
    }

    if(file_length>2){
        console.log("2");
        reader_array[2].addEventListener("load", function () {
            preview_array[2].src = reader_array[2].result;
        }, false);
    }

    if(file_length>3){
        console.log("3");
        reader_array[3].addEventListener("load", function () {
            preview_array[3].src = reader_array[3].result;
        }, false);
    }

    for(var i=0; i<file_length; i++){
        reader_array[i].readAsDataURL(file_array[i]);
    }
}
