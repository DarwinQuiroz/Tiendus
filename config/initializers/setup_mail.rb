#Configuración de envio de correos para producción

ActionMailer::Base.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    user_name: "tiendus@gmail.com",
    password: "12345678",
    authentication: :login, #plain | login
    enable_starttls_auto: true
}