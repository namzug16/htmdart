create table tasks (
    id uuid default gen_random_uuid() primary key,
    owner_ip text not null,
    content text not null,
    is_completed boolean not null default false
);
