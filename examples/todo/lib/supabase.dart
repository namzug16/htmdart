import 'package:supabase/supabase.dart';
import 'package:todo/env.dart';

final supabase = SupabaseClient(Env.supabaseUrl, Env.supabaseKey);
