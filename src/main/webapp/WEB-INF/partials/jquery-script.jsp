<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script>
    function set () {
        $().ready(function () {
            function selectImgDisplay(value) {
                if (value === 'Cat') {
                    $.get("https://api.thecatapi.com/v1/images/search").done(function (data) {
                        $('#change-image').attr('src', data[0].url);
                        $('#change-imageF').attr('src', data[0].url)
                        $('#imageUrl').attr('value',data[0].url)
                        $('#imageUrlF').attr('value',data[0].url)
                    }).fail(function (jqXhr, status, error) {
                        console.log(error);
                        console.log(status);
                    })
                } else if (value === 'Dog') {
                    $.get("https://dog.ceo/api/breeds/image/random").done(function (data) {
                        $('#change-image').attr('src', data.message);
                        $('#change-imageF').attr('src', data.message);
                        $('#imageUrl').attr('value', data.message);
                        $('#imageUrlF').attr('value', data.message);
                    }).fail(function (jqXhr, status, error) {
                        console.log(error);
                        console.log(status);
                    })
                } else {
                    return;
                }
                $('#image-display').removeClass('d-none');
                $('#image-displayF').removeClass('d-none');
            }

            const value = $('#type').val();
            const valueF = $('#typeFoster').val()

            $(document).on('click', '#type', selectImgDisplay(value));
            $(document).on('click', '#typeFoster', selectImgDisplay(valueF));

        })
    }
</script>