// This file may be used for providing additional customizations to the Trestle
// admin. It will be automatically included within all admin pages.
//
// For organizational purposes, you may wish to define your customizations
// within individual partials and `require` them here.
//
//  e.g. //= require "trestle/custom/my_custom_js"

const collapseAppNav = () => {
    let dropdowns = $(".app-nav ul[data-group='gems']:not(:has(.active))")
    dropdowns.each((_i, element) => {
        element.classList.add("collapsed")
    })
}

// Fade flash messages after 3 seconds.
const removeAlerts = () => {
    let alertDiv = $(".alert-success")
    if (alertDiv.length) {
        setTimeout(() => {
            alertDiv.fadeOut()
        }, 3000)
    }
}

Trestle.init(() => {
    removeAlerts()
    collapseAppNav()
})
