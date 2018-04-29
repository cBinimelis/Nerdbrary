function Alerta(tit, mens, stat) {
    swal({
        title: tit,
        text: mens,
        icon: stat,
        dangerMode: true
    })
}

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