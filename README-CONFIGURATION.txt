# Carnet de vocabulaire — version Supabase pour Vercel

## Base de données gratuite conseillée
Supabase Free : PostgreSQL + authentification e-mail/mot de passe. Les mots sont stockés dans une ligne JSON par compte, protégée par Row Level Security (RLS). Chaque compte ne peut lire/modifier que son propre carnet.

## Configuration

1. Crée un compte sur https://supabase.com et crée un nouveau projet.
2. Dans le projet, ouvre **SQL Editor** > **New query**, colle le contenu de `supabase-schema.sql`, puis clique **Run**.
3. Dans **Project Settings** > **API** (ou **Connect** selon l'interface), copie :
   - l'URL du projet (`Project URL`)
   - la clé publique `anon` / `publishable key` (jamais la `service_role`).
4. Ouvre `index.html` et remplace :
   - `COLLE_ICI_URL_SUPABASE` par l'URL de ton projet, par exemple `https://xxxx.supabase.co`
   - `COLLE_ICI_CLE_PUBLIQUE_ANON` par la clé publique/anon.
5. Enregistre. Compresse le contenu du dossier (le fichier `index.html`, `vercel.json` et `supabase-schema.sql`; le SQL n'est pas nécessaire au déploiement) ou pousse les fichiers du site dans ton dépôt GitHub.
6. Sur Vercel, importe le dépôt GitHub et déploie. Si le site est déjà déployé, pousse les changements dans GitHub pour déclencher un nouveau déploiement.
7. Ouvre l'adresse du site, crée un compte, puis connecte-toi. À la première connexion sur un compte, le carnet local du navigateur est importé dans le cloud. Ensuite, les modifications sont synchronisées automatiquement.

## Important
- La clé `anon` / `publishable` est prévue pour être utilisée côté navigateur avec RLS activée. **Ne mets jamais la clé `service_role` dans `index.html`.**
- Pour les comptes, Supabase peut demander une confirmation par e-mail selon les réglages d'Authentication.
- Le stockage local existant est importé lors de la première connexion d'un compte uniquement si aucune sauvegarde cloud n'existe encore pour ce compte.
- Cette version synchronise le carnet et le journal de révision. Teste la création, modification, suppression et révision d'un mot après configuration.
- Pour garder les anciennes données, fais d'abord **Exporter JSON** dans l'application originale.
