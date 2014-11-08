var callToDB = function(URL, type, data, onSuccess, onError) {
    $.ajax({
        url: URL,
        context: document.body,
        cache: false,
        data: data,
        type: type,
        success: onSuccess,
        error: onError
    });
};