function Alerta(tit, mens, stat) {
    swal({
        title: tit,
        text: mens,
        icon: stat,
        dangerMode: true
    })
}

    $(window).load(function () {
        $('#preloader').fadeOut('slow', function () { $(this).remove(); });
    });

function Redirect(UrlPath) {
    window.location.hef = UrlPath;
}

function Delete(ctl, event) {
    var defaultAction = $(ctl).prop("href");
    event.preventDefault();
    swal({
        title: "Para evitar errores...",
        text: "¿Estás seguro de querer borrar esto?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            window.location.href = defaultAction;
            return true;
        } else {
            swal({
                title: "Estuvo bien preguntar",
                text: "No se ha eliminado nada",
                icon: "info"
            });
            return false;
        }
    });
}

function VPrevia(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {

            document.getElementById("ContentPlaceHolder1_imagen_vprevia").setAttribute("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}