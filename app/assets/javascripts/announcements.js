console.log('ok');

document.addEventListener("DOMContentLoaded", function(event) {
    console.log('loaded');

    let elements = document.querySelectorAll('.contact-modal-toggle');
    elements.forEach(element => {
        element.addEventListener('click',openModalEventListener);
    });

    function openModalEventListener(event) {
        let modal = document.querySelector(`#${event.target.attributes['data-target'].value}`);
        modal.classList.add('is-active');
    }
    function closeModalEventListener(event) {
        event.target.parentElement.classList.remove('is-active');

    }

    let close = document.querySelectorAll('.modal-close');
    close.forEach(element => {
        element.addEventListener('click',closeModalEventListener);
    });

});
