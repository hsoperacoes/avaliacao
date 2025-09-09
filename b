<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Feedback de Integração — Sistema de RH</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>

  <style>
    /* ===== Reset & base ===== */
    *{margin:0;padding:0;box-sizing:border-box}
    body{
      font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
      line-height:1.6;color:#eaeaea;background:#1a1a1a;min-height:100vh;padding:20px 0
    }
    .container{max-width:1200px;margin:0 auto;padding:0 20px}

    /* ===== Header ===== */
    .form-header{
      background:linear-gradient(135deg,#2c3e50 0%,#34495e 100%);
      color:#fff;padding:40px 30px;text-align:center;border-radius:15px 15px 0 0;
      box-shadow:0 4px 20px rgba(0,0,0,.3);position:relative;overflow:hidden
    }
    .form-header::before{
      content:'';position:absolute;top:-50%;left:-50%;width:200%;height:200%;
      background:radial-gradient(circle,rgba(255,255,255,.06) 0%,transparent 70%);
      animation:rotate 30s linear infinite
    }
    @keyframes rotate{from{transform:rotate(0)}to{transform:rotate(360deg)}}
    .header-content{position:relative;z-index:1}
    .header-icon{font-size:3em;margin-bottom:16px;color:#4CAF50}
    .form-header h1{font-size:2.1em;font-weight:700;margin-bottom:6px}
    .form-header h2{font-size:1.2em;font-weight:500;opacity:.9}

    /* ===== Shell ===== */
    .form-container{
      background:#2a2a2a;border-radius:0 0 15px 15px;
      box-shadow:0 4px 20px rgba(0,0,0,.3);padding:28px
    }
    .form-block{
      background:#3a3a3a;border-radius:12px;margin-bottom:22px;
      box-shadow:0 4px 15px rgba(0,0,0,.2);border-left:4px solid #4CAF50
    }
    .block-header{
      background:linear-gradient(135deg,#4CAF50 0%,#45a049 100%);
      color:#fff;padding:16px 22px;border-radius:8px 8px 0 0;
      display:flex;align-items:center;gap:12px
    }
    .block-header h3{font-size:1.08em;font-weight:800;margin:0}
    .block-content{padding:22px}

    /* ===== Grid ===== */
    .form-grid{display:grid;grid-template-columns:repeat(12,1fr);gap:16px;align-items:start}
    .col-12{grid-column:span 12}.col-6{grid-column:span 6}.col-4{grid-column:span 4}.col-3{grid-column:span 3}
    @media(max-width:800px){.col-6{grid-column:span 12}.col-4{grid-column:span 12}.col-3{grid-column:span 6}}

    /* ===== Inputs ===== */
    label{color:#e6e6e6;font-weight:600;margin-bottom:6px;display:block}
    input[type="text"],input[type="email"],input[type="tel"],input[type="date"],input[type="number"],textarea,select{
      width:100%;background:#4a4a4a;border:2px solid #555;border-radius:10px;padding:12px 14px;color:#eaeaea;
      font-size:1rem;transition:.2s ease;display:block
    }
    textarea{min-height:90px;resize:vertical}
    input:focus,textarea:focus,select:focus{outline:none;border-color:#4CAF50;box-shadow:0 0 0 3px rgba(76,175,80,.2);background:#565656}
    ::placeholder{color:#bdbdbd}

    /* Pills / radios */
    .radio-row{display:flex;gap:12px;flex-wrap:wrap;margin-top:8px}
    .pill{display:inline-flex;align-items:center;gap:10px;cursor:pointer;user-select:none;
      padding:10px 14px;border-radius:10px;background:#4a4a4a;border:2px solid #555;color:#eaeaea;font-weight:600}
    .pill input{display:none}
    .dot{width:18px;height:18px;border:2px solid #888;border-radius:50%;position:relative;flex-shrink:0}
    .pill input:checked + .dot{border-color:#4CAF50;background:#4CAF50}
    .pill input:checked + .dot::after{content:'';position:absolute;inset:4px;background:#fff;border-radius:50%}

    /* Q item */
    .q-block{background:#444;border:2px solid #555;border-radius:12px;padding:16px;margin-bottom:14px}
    .q-title{font-weight:800;color:#a5e8b1;margin-bottom:10px}
    .q-inline{display:grid;grid-template-columns:180px 1fr;gap:12px;align-items:start}
    @media(max-width:800px){.q-inline{grid-template-columns:1fr}}

    /* Range pair */
    .range-wrap{display:flex;align-items:center;gap:12px}
    .range-wrap input[type=range]{flex:1}
    .badge{display:inline-block;background:#2a2a2a;border:2px solid #555;border-radius:10px;padding:8px 12px;font-weight:800;color:#fff}

    /* ===== Actions ===== */
    .actions{display:flex;gap:14px;justify-content:center;margin-top:26px;padding-top:22px;border-top:2px solid #555;flex-wrap:wrap}
    .btn{display:inline-flex;align-items:center;gap:10px;padding:12px 20px;border:none;border-radius:10px;font-size:1rem;
      font-weight:800;cursor:pointer;text-transform:uppercase;letter-spacing:.5px;text-decoration:none}
    .btn-primary{background:linear-gradient(135deg,#4CAF50 0%,#45a049 100%);color:#fff}
    .btn-secondary{background:linear-gradient(135deg,#2196F3 0%,#1976D2 100%);color:#fff}
    .btn-danger{background:linear-gradient(135deg,#f44336 0%,#d32f2f 100%);color:#fff}
    .btn-link{background:transparent;color:#90caf9;border:2px solid #90caf9}

    .success{display:none;background:#2e7d32;color:#fff;border-radius:10px;padding:14px;text-align:center;margin-bottom:16px}
    .loading{display:none;color:#4CAF50;text-align:center;margin-bottom:12px}

    /* Toast */
    .toast{position:fixed;bottom:22px;left:50%;transform:translateX(-50%);background:#323232;color:#fff;padding:10px 16px;border-radius:8px;
      box-shadow:0 8px 24px rgba(0,0,0,.45);opacity:0;pointer-events:none;transition:opacity .25s ease;z-index:9999}
    .toast.show{opacity:1}
  </style>
</head>
<body>
  <div class="container">
    <header class="form-header">
      <div class="header-content">
        <i class="fas fa-clipboard-check header-icon"></i>
        <h1>FEEDBACK DE INTEGRAÇÃO</h1>
        <h2>Relatório após a integração feita na Loja</h2>
        <p>Preencha o feedback do colaborador após concluir todas as etapas de onboarding.</p>
      </div>
    </header>

    <div class="form-container">
      <div id="okMsg" class="success"><i class="fas fa-check-circle"></i> Feedback enviado!</div>
      <div id="loading" class="loading"><i class="fas fa-spinner fa-spin"></i> Enviando…</div>

      <form id="feedbackForm">
        <!-- Funcionário -->
        <section class="form-block">
          <div class="block-header"><i class="fas fa-user"></i><h3>Dados do Funcionário</h3></div>
          <div class="block-content">
            <div class="form-grid">
              <div class="col-6">
                <label for="emp_nome">Nome</label>
                <input id="emp_nome" name="emp_nome" type="text" readonly/>
              </div>
              <div class="col-3">
                <label for="emp_cargo">Cargo</label>
                <input id="emp_cargo" name="emp_cargo" type="text" readonly/>
              </div>
              <div class="col-3">
                <label for="emp_gerente">Gerente</label>
                <input id="emp_gerente" name="emp_gerente" type="text" readonly/>
              </div>
              <div class="col-3">
                <label for="emp_inicio">Data de Início</label>
                <input id="emp_inicio" name="emp_inicio" type="text" readonly/>
              </div>
              <div class="col-3">
                <label for="data_feedback">Data do Feedback *</label>
                <input id="data_feedback" name="data_feedback" type="date" required/>
              </div>
            </div>
          </div>
        </section>

        <!-- Perguntas -->
        <section class="form-block">
          <div class="block-header"><i class="fas fa-list-ol"></i><h3>Perguntas</h3></div>
          <div class="block-content">
            <div class="q-block">
              <div class="q-title">1 — Ficou claro quais serão suas tarefas?</div>
              <textarea name="q1" placeholder="Descreva…"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">2 — Quem mais te ajudou no processo?</div>
              <textarea name="q2" placeholder="Nomes / áreas…"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">3 — Quanto você se sente seguro(a) para atuar na área solicitada? (0 a 10)</div>
              <div class="range-wrap">
                <input type="range" id="q3range" min="0" max="10" step="1" value="5" oninput="q3out.value=this.value">
                <input type="number" id="q3out" name="q3" class="badge" min="0" max="10" value="5" oninput="q3range.value=this.value">
              </div>
            </div>

            <div class="q-block">
              <div class="q-title">4 — O que você achou mais difícil e mais fácil?</div>
              <textarea name="q4" placeholder="Explique…"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">5 — O direcionamento da gerência acontece com qual frequência na sua percepção?</div>
              <div class="radio-row">
                <label class="pill"><input type="radio" name="q5" value="Sempre" required><span class="dot"></span>Sempre</label>
                <label class="pill"><input type="radio" name="q5" value="Às vezes"><span class="dot"></span>Às vezes</label>
                <label class="pill"><input type="radio" name="q5" value="Nunca"><span class="dot"></span>Nunca</label>
              </div>
            </div>

            <div class="q-block">
              <div class="q-title">6 — Você se sente parte da equipe após a integração? Justifique.</div>
              <textarea name="q6" placeholder="Justifique…"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">7 — Foi lhe apresentado todas as ferramentas e demais operações da empresa que estarão à sua disposição? Se sim, qual te chamou mais a atenção?</div>
              <textarea name="q7"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">8 — Foi lhe apresentado o estoque?</div>
              <div class="radio-row">
                <label class="pill"><input type="radio" name="q8" value="Sim" required><span class="dot"></span>Sim</label>
                <label class="pill"><input type="radio" name="q8" value="Não"><span class="dot"></span>Não</label>
              </div>
            </div>

            <div class="q-block">
              <div class="q-title">9 — Foi lhe apresentada a área de vendas? (dobras, divisões de setores, etc.)</div>
              <div class="radio-row" style="margin-bottom:8px">
                <label class="pill"><input type="radio" name="q9" value="Sim" required><span class="dot"></span>Sim</label>
                <label class="pill"><input type="radio" name="q9" value="Não"><span class="dot"></span>Não</label>
              </div>
              <textarea name="q9_obs" placeholder="Detalhes (opcional)…"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">10 — Como foi seu primeiro dia de vendas?</div>
              <textarea name="q10"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">11 — Você acha que teve um bom acompanhamento e auxílio durante seus atendimentos?</div>
              <textarea name="q11"></textarea>
            </div>

            <div class="q-block">
              <div class="q-title">12 — Dê uma sugestão para melhorarmos a nossa integração.</div>
              <textarea name="q12"></textarea>
            </div>
          </div>
        </section>

        <!-- Ações -->
        <div class="actions">
          <button id="submitBtn" type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> Enviar Feedback</button>
          <button type="button" class="btn btn-secondary" onclick="downloadTXT()"><i class="fas fa-file-alt"></i> Baixar TXT</button>
          <button type="reset" class="btn btn-danger"><i class="fas fa-eraser"></i> Limpar</button>
          <a class="btn btn-link" href="/avaliacao/home.html"><i class="fas fa-home"></i> Home</a>
          <a class="btn btn-link" href="/avaliacao/funcionarios.html"><i class="fas fa-users"></i> Lista</a>
        </div>
      </form>
    </div>
  </div>

  <div id="toast" class="toast">Mensagem</div>

  <script>
    /* ====== CONFIG: URL do seu GAS ====== */
    const EVAL_GAS_WEB_APP_URL = 'https://script.google.com/macros/s/AKfycbzx7fZB5WPpdAI7nUADWhzWZF83CyTKIl50jkOeJanoPao9t1eecOQ5CrshZksO5A5e/exec';

    const form = document.getElementById('feedbackForm');
    const loading = document.getElementById('loading');
    const ok = document.getElementById('okMsg');
    const submitBtn = document.getElementById('submitBtn');

    /* Boot */
    document.addEventListener('DOMContentLoaded', () => {
      const today = new Date().toISOString().split('T')[0];
      const d = document.getElementById('data_feedback');
      if (d && !d.value) d.value = today;

      // Preenche dados do funcionário (localStorage.currentEmployee)
      try{
        const cur = JSON.parse(localStorage.getItem('currentEmployee')||'{}');
        if(cur && cur.name){
          document.getElementById('emp_nome').value = cur.name || '—';
          document.getElementById('emp_cargo').value = cur.position || '—';
          document.getElementById('emp_gerente').value = cur.manager || '—';
          document.getElementById('emp_inicio').value = formatDate(cur.startDate) || '—';
        }
      }catch(_){}
    });

    function formatDate(s){
      const d=new Date(s);
      return isNaN(d)?String(s):d.toLocaleDateString('pt-BR');
    }

    function toast(msg){
      const t=document.getElementById('toast');
      t.textContent=msg; t.classList.add('show');
      setTimeout(()=>t.classList.remove('show'),2200);
    }

    function formToJSON(form){
      const fd = new FormData(form);
      const data = {};
      for (const [k,v] of fd.entries()){ data[k]=v && v.trim ? v.trim() : v; }
      return data;
    }

    async function sendToGAS(payload){
      if(!EVAL_GAS_WEB_APP_URL) throw new Error('URL do GAS não configurada.');
      const res = await fetch(EVAL_GAS_WEB_APP_URL, {
        method:'POST',
        headers:{'Content-Type':'text/plain'},
        body: JSON.stringify(payload)
      });
      if(!res.ok) throw new Error('Falha HTTP ao enviar para o GAS');
      return res.json();
    }

    /* Gera TXT local */
    function buildTxt(data){
      const lines = [
        'FEEDBACK DE INTEGRAÇÃO',
        '',
        `Funcionário: ${document.getElementById('emp_nome').value||'—'}`,
        `Cargo: ${document.getElementById('emp_cargo').value||'—'}`,
        `Gerente: ${document.getElementById('emp_gerente').value||'—'}`,
        `Início: ${document.getElementById('emp_inicio').value||'—'}`,
        `Data do Feedback: ${data.data_feedback||'—'}`,
        '',
        '1) Ficou claro quais serão suas tarefas?',
        data.q1||'',
        '',
        '2) Quem mais te ajudou no processo?',
        data.q2||'',
        '',
        '3) Segurança para atuar (0–10):',
        String(data.q3 ?? ''),
        '',
        '4) O que foi mais difícil / mais fácil?',
        data.q4||'',
        '',
        '5) Frequência do direcionamento da gerência:',
        data.q5||'',
        '',
        '6) Sente-se parte da equipe? Justifique:',
        data.q6||'',
        '',
        '7) Ferramentas apresentadas / o que chamou atenção:',
        data.q7||'',
        '',
        '8) Apresentação do estoque:',
        data.q8||'',
        '',
        '9) Área de vendas (dobras, divisões, etc.):',
        data.q9||'',
        (data.q9_obs?('Detalhes: '+data.q9_obs):''),
        '',
        '10) Primeiro dia de vendas:',
        data.q10||'',
        '',
        '11) Acompanhamento e auxílio nos atendimentos:',
        data.q11||'',
        '',
        '12) Sugestão para melhorar a integração:',
        data.q12||'',
      ];
      return lines.join('\n');
    }

    function downloadTXT(){
      const data = formToJSON(form);
      const content = buildTxt(data);
      const blob = new Blob([content], {type:'text/plain;charset=utf-8'});
      const url = URL.createObjectURL(blob);
      const safe = (document.getElementById('emp_nome').value||'Funcionario').replace(/\s+/g,'_');
      const iso = new Date().toISOString().slice(0,10);
      const a = document.createElement('a');
      a.href=url; a.download=`feedback_integracao_${safe}_${iso}.txt`;
      document.body.appendChild(a); a.click(); a.remove(); URL.revokeObjectURL(url);
    }

    form.addEventListener('submit', async (e) => {
      e.preventDefault();
      loading.style.display='block'; ok.style.display='none';
      submitBtn.disabled = true;

      const payload = formToJSON(form);

      // anexa metadados do funcionário
      try{
        const cur = JSON.parse(localStorage.getItem('currentEmployee')||'{}');
        payload.employeeId = cur.id || '';
        payload.employeeName = cur.name || '';
        payload.position = cur.position || '';
        payload.manager = cur.manager || '';
        payload.startDate = cur.startDate || '';
      }catch(_){}

      try{
        await sendToGAS({ type:'final-feedback', data: payload, txt: buildTxt(payload) });
        loading.style.display='none'; ok.style.display='block';
        toast('Feedback enviado com sucesso.');
        setTimeout(()=>{ window.location.href='/avaliacao/funcionarios.html'; }, 900);
      }catch(err){
        console.warn('Falha no backend:', err);
        loading.style.display='none';
        ok.style.display='block';
        toast('Sem conexão. Baixe o TXT e envie manualmente por enquanto.');
      }finally{
        submitBtn.disabled=false;
      }
    });
  </script>
</body>
</html>
