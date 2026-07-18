# Refúgio do Pet — painel interno (versão publicável)

Este é o mesmo sistema que você usava aqui no Claude, adaptado para
funcionar como um site de verdade, com um link fixo e dados
compartilhados entre você e seus funcionários.

## O que muda em relação à versão do Claude

- Antes: os dados ficavam salvos só na sua conta do Claude.
- Agora: os dados ficam num banco de dados (Supabase) que todos os
  funcionários acessam pelo mesmo link, ao mesmo tempo — inclusive
  com atualização automática: se um funcionário cadastra um cliente,
  os outros veem sem precisar recarregar a página.

## Passo 1 — Criar o banco de dados (Supabase)

1. Crie uma conta grátis em https://supabase.com
2. Clique em "New project". Dê um nome (ex: refugio-do-pet) e uma senha
   de banco (guarde essa senha, mas você não vai precisar dela no dia a dia)
3. Espere o projeto ser criado (leva cerca de 2 minutos)
4. No menu lateral, vá em "SQL Editor" > "New query"
5. Abra o arquivo `supabase-setup.sql` (está nesta mesma pasta), copie
   todo o conteúdo, cole no editor e clique em "Run"
6. Vá em "Project Settings" (ícone de engrenagem) > "API"
7. Copie dois valores: "Project URL" e a chave "anon public"
   — você vai usar os dois no próximo passo

## Passo 2 — Colocar o código no GitHub

1. Crie uma conta grátis em https://github.com (se ainda não tiver)
2. Crie um repositório novo, ex: `refugio-pet-painel`
3. Suba todos os arquivos desta pasta para esse repositório
   (pelo site do GitHub mesmo: "Add file" > "Upload files", arraste
   tudo exceto a pasta node_modules, que não existe ainda)

## Passo 3 — Publicar (Vercel)

1. Crie uma conta grátis em https://vercel.com (pode entrar direto
   com sua conta do GitHub)
2. Clique em "Add New" > "Project" e selecione o repositório que
   você acabou de subir
3. Antes de clicar em "Deploy", abra "Environment Variables" e
   adicione duas:
   - `VITE_SUPABASE_URL` → cole o "Project URL" do Supabase
   - `VITE_SUPABASE_ANON_KEY` → cole a chave "anon public" do Supabase
4. Clique em "Deploy"
5. Em cerca de 1 minuto, a Vercel te dá um link, algo como
   `refugio-pet-painel.vercel.app` — esse é o link fixo que você
   pode mandar para seus funcionários e salvar nos favoritos

Pronto: qualquer pessoa com esse link acessa o mesmo painel, vendo os
mesmos clientes, pets, agendamentos e financeiro.

## Importante sobre segurança

Neste momento, o sistema não pede login — qualquer pessoa com o link
consegue ver e editar os dados. Para um petshop pequeno com equipe de
confiança, isso costuma ser aceitável, desde que o link não seja
divulgado publicamente. Se no futuro você quiser exigir que cada
funcionário faça login com usuário e senha (e, por exemplo, restringir
o financeiro só para você), é possível adicionar isso — me avise
quando quiser evoluir para essa etapa.

## Atualizações futuras

Sempre que eu (ou você) alterar o código, é só subir a alteração no
GitHub — a Vercel publica a nova versão automaticamente em segundos.
