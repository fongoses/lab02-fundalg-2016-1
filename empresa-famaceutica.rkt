;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname empresa-famaceutica) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Projeto: Fundamentos de Algoritmos
;; Período: 2016-1
;; Tarefa: Laboratório 2
;;
;; Responsável: Luiz Gustavo Frozi de Castro e Souza / 96957
;;
;; Changelog: 
;;     * 2016-03-29
;;         - Definição de Estruturas
;;         - Funções para manipulação

(define-struct medicamento (codigo p-ativo valor cor-tarja codigo-anvisa))
;; Um elemento medicamento do conjunto Medicamento é uma estrutura do tipo:
;; (make-medicamento c pa v ct ca)
;; onde:
;; c (string): Código do Medicamento
;; pa (string): Princípio Ativo do Medicamento
;; v (number): Valor Unitário, em Reais, do Medicamento
;; ct (symbol): Cor da Tarja do Medicamento, que pode ser um dos valores: 'branca, 'amarela, 'vermelha ou 'preta
;; ca (string): Código da ANVISA da Empresa que fabrica o Medicamento
(define apracur        (make-medicamento "01" "curalina"       10.00 'branca   "LAB01"))
(define maracujina     (make-medicamento "02" "calmalina"       5.00 'branca   "LAB01"))
(define derrubol       (make-medicamento "03" "calmalina"      50.00 'vermelha "LAB01"))
(define derrubol-ultra (make-medicamento "04" "calmalina"     100.00 'preta    "LAB01"))
(define pomadinha      (make-medicamento "05" "curalina"       20.00 'amarela  "LAB01"))
(define higienol       (make-medicamento "AA" "sal grosso"     10.00 'branca   "LAB02"))
(define calma-calma    (make-medicamento "BB" "calmalina"       5.00 'amarela  "LAB02"))
(define tira-bicho     (make-medicamento "CC" "soda cáustica"  20.00 'preta    "LAB02"))

(define-struct empresa (codigo-anvisa total total-branca total-amarela total-vermelha total-preta))
;; Um elemento empresa do conjunto Empresa é uma estrutura do tipo:
;; (make-empresa ca t tb ta tv tp)
;; onde:
;; ca (string): Código da ANVISA da Empresa
;; t (number): Total de Medicamentos que a Empresa possui
;; tb (number): Total de Medicamentos com a Tarja Branca que a Empresa possui
;; ta (number): Total de Medicamentos com a Tarja Amarela que a Empresa possui
;; tv (number): Total de Medicamentos com a Tarja Vermelha que a Empresa possui
;; tp (number): Total de Medicamentos com a Tarja Preta que a Empresa possui
(define tabajara-lab (make-empresa "LAB01" 5 2 1 1 1))
(define butanta      (make-empresa "LAB02" 3 1 1 0 1))

;; Contrato: verifica-medicamento: medicamento string string -> boolean
;; Objetivo: função que, dados um medicamento, um nome de princípio ativo e um código de medicamento, determine se o medicamento informada possui o princípio ativo fornecido e corresponde ao código indicado
;; Exemplos:
