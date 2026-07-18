-- Cole este script inteiro no Supabase: aba "SQL Editor" > "New query" > Run

create table if not exists app_storage (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz default now()
);

alter table app_storage enable row level security;

-- Libera leitura e escrita para quem tiver o link do sistema.
-- Como não há tela de login, qualquer pessoa com a URL e a chave "anon"
-- consegue ler e alterar os dados. Isso é aceitável para uso interno
-- com link não divulgado publicamente, mas não é uma barreira de segurança
-- real. Se quiser exigir login por funcionário no futuro, me avise.
create policy "allow all read" on app_storage for select using (true);
create policy "allow all write" on app_storage for insert with check (true);
create policy "allow all update" on app_storage for update using (true);

-- Habilita atualização em tempo real (para todos verem mudanças na hora)
alter publication supabase_realtime add table app_storage;
