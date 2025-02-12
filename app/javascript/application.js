// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"
import './application.tailwind.css'

document.addEventListener("DOMContentLoaded", function() {
    console.log("Chartkick carregado:", typeof Chartkick !== "undefined");
});