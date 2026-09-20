<?php

namespace App\Controllers;

use App\Models\CompromissoModel;
use App\Models\ControleDeAcessoModel;

use CodeIgniter\Controller;

class Agenda extends Controller
{
    private $link = [
        'item' => '11'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $compromisso_model;
    private $controle_de_acesso_model;

    private $permissao;

    function __construct()
    {
        $this->session = session();
        $this->id_empresa  = $this->session->get('id_empresa');
        $this->id_login    = $this->session->get('id_login');

        $this->compromisso_model        = new CompromissoModel();
        $this->controle_de_acesso_model = new ControleDeAcessoModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('agenda');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Agenda',
            'icone'  => 'fa fa-calendar-alt'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request->getVar();

        if(!isset($dados['data'])):
            $dados['data'] = date('Y-m-d');
        endif;

        $horarios = ['07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '00:00', ];

        foreach($horarios as $horario) :
            $compromisso = $this->compromisso_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data', $dados['data'])
                                ->where('horario', $horario)
                                ->orderBy('horario', 'ASC')
                                ->findAll();
            
            if(!empty($compromisso)):
                $compromissos[] = $compromisso;
            else:
                $compromissos[] = [
                    'horario' => $horario,
                ];
            endif;  
        endforeach;

        $data['compromissos'] = $compromissos;
        $data['data'] = $dados['data'];

        echo view('templates/header', $data);
        echo view('agenda/index');
        echo view('templates/footer');
    }

    public function create()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Novo Compromisso',
            'icone'  => 'fa fa-calendar-alt'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request->getVar();

        $horarios = ['07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '00:00', ];

        foreach($horarios as $horario) :
            $compromisso = $this->compromisso_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data', $dados['data'])
                                ->where('horario', $dados['horario'])
                                ->orderBy('horario', 'ASC')
                                ->findAll();
            
            // Caso seja vazio então esse horário está disponível
            if(empty($compromisso)):
                $horarios_disponiveis[] = $horario;
            endif;  
        endforeach;

        $data['data'] = $dados['data'];
        $data['horario'] = $dados['horario'];
        $data['horarios_disponiveis'] = $horarios_disponiveis;

        echo view('templates/header', $data);
        echo view('agenda/form');
        echo view('templates/footer');
    }

    public function edit($id_compromisso)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Novo Compromisso',
            'icone'  => 'fa fa-calendar-alt'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request->getVar();

        $compromisso = $this->compromisso_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_compromisso', $id_compromisso)
                                ->first();

        $data['compromisso'] = $compromisso;

        echo view('templates/header', $data);
        echo view('agenda/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getVar();

        // Caso a ação seja editar
        if(isset($dados['id_compromisso'])) :
            $this->compromisso_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type' => 'success',
                    'title' => 'Compromisso atualizado com sucesso!'
                ]
            );

            return redirect()->to("/agenda/edit/{$dados['id_compromisso']}");
        endif;

        // Caso ação seja cadastrar
        $dados['id_empresa'] = $this->id_empresa;

        $this->compromisso_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Compromisso cadastrado com sucesso!'
            ]
        );

        return redirect()->to("/agenda?data={$dados['data']}");
    }

    public function delete($id_compromisso, $data)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->compromisso_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_compromisso', $id_compromisso)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Compromisso excluido com sucesso!'
            ]
        );

        return redirect()->to("/agenda?data={$data}");
    }
}

?>