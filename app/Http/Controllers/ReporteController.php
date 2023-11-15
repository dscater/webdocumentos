<?php

namespace App\Http\Controllers;

use App\Models\Documento;
use App\Models\User;
use Illuminate\Http\Request;
use PDF;

class ReporteController extends Controller
{
    public function usuarios(Request $request)
    {
        $filtro =  $request->filtro;
        $usuarios = User::where('id', '!=', 1)->orderBy("paterno", "ASC")->get();

        if ($filtro == 'Tipo de usuario') {
            $request->validate([
                'tipo' => 'required',
            ]);
            $usuarios = User::where('id', '!=', 1)->where('tipo', $request->tipo)->orderBy("paterno", "ASC")->get();
        }

        $pdf = PDF::loadView('reportes.usuarios', compact('usuarios'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('Usuarios.pdf');
    }

    public function documentos(Request $request)
    {
        $filtro =  $request->filtro;
        $estante =  $request->estante;

        $documentos = Documento::where("estado", "EN ARCHIVO")->get();

        if ($filtro != 'Todos') {
            $request->validate([
                "estante" => "required"
            ], [
                "estante.required" => "Debes seleccionar un estante"
            ]);
            if ($estante != '') {
                $documentos = Documento::where("estante_id", $estante)->where("estado", "EN ARCHIVO")->get();
            }
        }

        $pdf = PDF::loadView('reportes.documentos', compact('documentos'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('documentos.pdf');
    }

    public function documentos_estados(Request $request)
    {
    }

    public function canitdad_documentos(Request $request)
    {
    }
}
