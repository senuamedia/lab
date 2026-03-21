; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"max_f64"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t9 = load i64, ptr %local.a
  %t10 = load i64, ptr %local.b
  %t11 = call i64 @"sx_f64_gt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.a
  br label %then1_end
then1_end:
  br label %endif1
else1:
  %t14 = load i64, ptr %local.b
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t15 = phi i64 [ %t13, %then1_end ], [ %t14, %else1_end ]
  ret i64 %t15
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t16 = load i64, ptr %local.x
  %t17 = load i64, ptr %local.lo
  %t18 = call i64 @"sx_f64_lt"(i64 %t16, i64 %t17)
  %t19 = icmp ne i64 %t18, 0
  br i1 %t19, label %then2, label %else2
then2:
  %t20 = load i64, ptr %local.lo
  ret i64 %t20
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t21 = phi i64 [ 0, %else2_end ]
  %t22 = load i64, ptr %local.x
  %t23 = load i64, ptr %local.hi
  %t24 = call i64 @"sx_f64_gt"(i64 %t22, i64 %t23)
  %t25 = icmp ne i64 %t24, 0
  br i1 %t25, label %then3, label %else3
then3:
  %t26 = load i64, ptr %local.hi
  ret i64 %t26
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t27 = phi i64 [ 0, %else3_end ]
  %t28 = load i64, ptr %local.x
  ret i64 %t28
}

define i64 @"bstep"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %nu, i64 %dt, i64 %dx, i64 %i) nounwind {
entry:
  %local.um.29 = alloca i64
  %local.ui.30 = alloca i64
  %local.up.31 = alloca i64
  %local.adv.32 = alloca i64
  %local.diff.33 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %t34 = load i64, ptr %local.u4
  store i64 %t34, ptr %local.um.29
  %t35 = load i64, ptr %local.u0
  store i64 %t35, ptr %local.ui.30
  %t36 = load i64, ptr %local.u1
  store i64 %t36, ptr %local.up.31
  %t37 = load i64, ptr %local.i
  %t38 = icmp eq i64 %t37, 1
  %t39 = zext i1 %t38 to i64
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %then4, label %else4
then4:
  %t41 = load i64, ptr %local.u0
  store i64 %t41, ptr %local.um.29
  %t42 = load i64, ptr %local.u1
  store i64 %t42, ptr %local.ui.30
  %t43 = load i64, ptr %local.u2
  store i64 %t43, ptr %local.up.31
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t44 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t45 = load i64, ptr %local.i
  %t46 = icmp eq i64 %t45, 2
  %t47 = zext i1 %t46 to i64
  %t48 = icmp ne i64 %t47, 0
  br i1 %t48, label %then5, label %else5
then5:
  %t49 = load i64, ptr %local.u1
  store i64 %t49, ptr %local.um.29
  %t50 = load i64, ptr %local.u2
  store i64 %t50, ptr %local.ui.30
  %t51 = load i64, ptr %local.u3
  store i64 %t51, ptr %local.up.31
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t52 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t53 = load i64, ptr %local.i
  %t54 = icmp eq i64 %t53, 3
  %t55 = zext i1 %t54 to i64
  %t56 = icmp ne i64 %t55, 0
  br i1 %t56, label %then6, label %else6
then6:
  %t57 = load i64, ptr %local.u2
  store i64 %t57, ptr %local.um.29
  %t58 = load i64, ptr %local.u3
  store i64 %t58, ptr %local.ui.30
  %t59 = load i64, ptr %local.u4
  store i64 %t59, ptr %local.up.31
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t60 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  %t61 = load i64, ptr %local.i
  %t62 = icmp eq i64 %t61, 4
  %t63 = zext i1 %t62 to i64
  %t64 = icmp ne i64 %t63, 0
  br i1 %t64, label %then7, label %else7
then7:
  %t65 = load i64, ptr %local.u3
  store i64 %t65, ptr %local.um.29
  %t66 = load i64, ptr %local.u4
  store i64 %t66, ptr %local.ui.30
  %t67 = load i64, ptr %local.u0
  store i64 %t67, ptr %local.up.31
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t68 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t69 = load i64, ptr %local.ui.30
  %t70 = load i64, ptr %local.up.31
  %t71 = load i64, ptr %local.um.29
  %t72 = call i64 @"sx_f64_sub"(i64 %t70, i64 %t71)
  %t73 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t72)
  %t74 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.2)
  %t75 = load i64, ptr %local.dx
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_div"(i64 %t73, i64 %t76)
  store i64 %t77, ptr %local.adv.32
  %t78 = load i64, ptr %local.nu
  %t79 = load i64, ptr %local.up.31
  %t80 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.3)
  %t81 = load i64, ptr %local.ui.30
  %t82 = call i64 @"sx_f64_mul"(i64 %t80, i64 %t81)
  %t83 = call i64 @"sx_f64_sub"(i64 %t79, i64 %t82)
  %t84 = load i64, ptr %local.um.29
  %t85 = call i64 @"sx_f64_add"(i64 %t83, i64 %t84)
  %t86 = call i64 @"sx_f64_mul"(i64 %t78, i64 %t85)
  %t87 = load i64, ptr %local.dx
  %t88 = load i64, ptr %local.dx
  %t89 = call i64 @"sx_f64_mul"(i64 %t87, i64 %t88)
  %t90 = call i64 @"sx_f64_div"(i64 %t86, i64 %t89)
  store i64 %t90, ptr %local.diff.33
  %t91 = load i64, ptr %local.ui.30
  %t92 = load i64, ptr %local.dt
  %t93 = load i64, ptr %local.diff.33
  %t94 = load i64, ptr %local.adv.32
  %t95 = call i64 @"sx_f64_sub"(i64 %t93, i64 %t94)
  %t96 = call i64 @"sx_f64_mul"(i64 %t92, i64 %t95)
  %t97 = call i64 @"sx_f64_add"(i64 %t91, i64 %t96)
  ret i64 %t97
}

define i64 @"max_grad"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %dx) nounwind {
entry:
  %local.g0.98 = alloca i64
  %local.g1.99 = alloca i64
  %local.g2.100 = alloca i64
  %local.g3.101 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %t102 = load i64, ptr %local.u1
  %t103 = load i64, ptr %local.u4
  %t104 = call i64 @"sx_f64_sub"(i64 %t102, i64 %t103)
  %t105 = call i64 @"abs_f64"(i64 %t104)
  %t106 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.4)
  %t107 = load i64, ptr %local.dx
  %t108 = call i64 @"sx_f64_mul"(i64 %t106, i64 %t107)
  %t109 = call i64 @"sx_f64_div"(i64 %t105, i64 %t108)
  store i64 %t109, ptr %local.g0.98
  %t110 = load i64, ptr %local.u2
  %t111 = load i64, ptr %local.u0
  %t112 = call i64 @"sx_f64_sub"(i64 %t110, i64 %t111)
  %t113 = call i64 @"abs_f64"(i64 %t112)
  %t114 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.5)
  %t115 = load i64, ptr %local.dx
  %t116 = call i64 @"sx_f64_mul"(i64 %t114, i64 %t115)
  %t117 = call i64 @"sx_f64_div"(i64 %t113, i64 %t116)
  store i64 %t117, ptr %local.g1.99
  %t118 = load i64, ptr %local.u3
  %t119 = load i64, ptr %local.u1
  %t120 = call i64 @"sx_f64_sub"(i64 %t118, i64 %t119)
  %t121 = call i64 @"abs_f64"(i64 %t120)
  %t122 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.6)
  %t123 = load i64, ptr %local.dx
  %t124 = call i64 @"sx_f64_mul"(i64 %t122, i64 %t123)
  %t125 = call i64 @"sx_f64_div"(i64 %t121, i64 %t124)
  store i64 %t125, ptr %local.g2.100
  %t126 = load i64, ptr %local.u4
  %t127 = load i64, ptr %local.u2
  %t128 = call i64 @"sx_f64_sub"(i64 %t126, i64 %t127)
  %t129 = call i64 @"abs_f64"(i64 %t128)
  %t130 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.7)
  %t131 = load i64, ptr %local.dx
  %t132 = call i64 @"sx_f64_mul"(i64 %t130, i64 %t131)
  %t133 = call i64 @"sx_f64_div"(i64 %t129, i64 %t132)
  store i64 %t133, ptr %local.g3.101
  %t134 = load i64, ptr %local.g0.98
  %t135 = load i64, ptr %local.g1.99
  %t136 = call i64 @"max_f64"(i64 %t134, i64 %t135)
  %t137 = load i64, ptr %local.g2.100
  %t138 = load i64, ptr %local.g3.101
  %t139 = call i64 @"max_f64"(i64 %t137, i64 %t138)
  %t140 = call i64 @"max_f64"(i64 %t136, i64 %t139)
  ret i64 %t140
}

define i64 @"evolve"(i64 %steps, i64 %nu, i64 %dt, i64 %dx, i64 %which) nounwind {
entry:
  %local.pi.141 = alloca i64
  %local.u0.142 = alloca i64
  %local.u1.143 = alloca i64
  %local.u2.144 = alloca i64
  %local.u3.145 = alloca i64
  %local.u4.146 = alloca i64
  %local.s.147 = alloca i64
  %local.n0.148 = alloca i64
  %local.n1.149 = alloca i64
  %local.n2.150 = alloca i64
  %local.n3.151 = alloca i64
  %local.n4.152 = alloca i64
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t153 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.8)
  store i64 %t153, ptr %local.pi.141
  %t154 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.9)
  %t155 = load i64, ptr %local.pi.141
  %t156 = call i64 @"sx_f64_mul"(i64 %t154, i64 %t155)
  %t157 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.10)
  %t158 = call i64 @"sx_f64_mul"(i64 %t156, i64 %t157)
  %t159 = call i64 @"sin_f64"(i64 %t158)
  store i64 %t159, ptr %local.u0.142
  %t160 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.11)
  %t161 = load i64, ptr %local.pi.141
  %t162 = call i64 @"sx_f64_mul"(i64 %t160, i64 %t161)
  %t163 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.12)
  %t164 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t163)
  %t165 = call i64 @"sin_f64"(i64 %t164)
  store i64 %t165, ptr %local.u1.143
  %t166 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.13)
  %t167 = load i64, ptr %local.pi.141
  %t168 = call i64 @"sx_f64_mul"(i64 %t166, i64 %t167)
  %t169 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.14)
  %t170 = call i64 @"sx_f64_mul"(i64 %t168, i64 %t169)
  %t171 = call i64 @"sin_f64"(i64 %t170)
  store i64 %t171, ptr %local.u2.144
  %t172 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.15)
  %t173 = load i64, ptr %local.pi.141
  %t174 = call i64 @"sx_f64_mul"(i64 %t172, i64 %t173)
  %t175 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.16)
  %t176 = call i64 @"sx_f64_mul"(i64 %t174, i64 %t175)
  %t177 = call i64 @"sin_f64"(i64 %t176)
  store i64 %t177, ptr %local.u3.145
  %t178 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.17)
  %t179 = load i64, ptr %local.pi.141
  %t180 = call i64 @"sx_f64_mul"(i64 %t178, i64 %t179)
  %t181 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.18)
  %t182 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t181)
  %t183 = call i64 @"sin_f64"(i64 %t182)
  store i64 %t183, ptr %local.u4.146
  store i64 0, ptr %local.s.147
  br label %loop8
loop8:
  %t184 = load i64, ptr %local.s.147
  %t185 = load i64, ptr %local.steps
  %t186 = icmp slt i64 %t184, %t185
  %t187 = zext i1 %t186 to i64
  %t188 = icmp ne i64 %t187, 0
  br i1 %t188, label %body8, label %endloop8
body8:
  %t189 = load i64, ptr %local.u0.142
  %t190 = load i64, ptr %local.u1.143
  %t191 = load i64, ptr %local.u2.144
  %t192 = load i64, ptr %local.u3.145
  %t193 = load i64, ptr %local.u4.146
  %t194 = load i64, ptr %local.nu
  %t195 = load i64, ptr %local.dt
  %t196 = load i64, ptr %local.dx
  %t197 = call i64 @"bstep"(i64 %t189, i64 %t190, i64 %t191, i64 %t192, i64 %t193, i64 %t194, i64 %t195, i64 %t196, i64 0)
  store i64 %t197, ptr %local.n0.148
  %t198 = load i64, ptr %local.u0.142
  %t199 = load i64, ptr %local.u1.143
  %t200 = load i64, ptr %local.u2.144
  %t201 = load i64, ptr %local.u3.145
  %t202 = load i64, ptr %local.u4.146
  %t203 = load i64, ptr %local.nu
  %t204 = load i64, ptr %local.dt
  %t205 = load i64, ptr %local.dx
  %t206 = call i64 @"bstep"(i64 %t198, i64 %t199, i64 %t200, i64 %t201, i64 %t202, i64 %t203, i64 %t204, i64 %t205, i64 1)
  store i64 %t206, ptr %local.n1.149
  %t207 = load i64, ptr %local.u0.142
  %t208 = load i64, ptr %local.u1.143
  %t209 = load i64, ptr %local.u2.144
  %t210 = load i64, ptr %local.u3.145
  %t211 = load i64, ptr %local.u4.146
  %t212 = load i64, ptr %local.nu
  %t213 = load i64, ptr %local.dt
  %t214 = load i64, ptr %local.dx
  %t215 = call i64 @"bstep"(i64 %t207, i64 %t208, i64 %t209, i64 %t210, i64 %t211, i64 %t212, i64 %t213, i64 %t214, i64 2)
  store i64 %t215, ptr %local.n2.150
  %t216 = load i64, ptr %local.u0.142
  %t217 = load i64, ptr %local.u1.143
  %t218 = load i64, ptr %local.u2.144
  %t219 = load i64, ptr %local.u3.145
  %t220 = load i64, ptr %local.u4.146
  %t221 = load i64, ptr %local.nu
  %t222 = load i64, ptr %local.dt
  %t223 = load i64, ptr %local.dx
  %t224 = call i64 @"bstep"(i64 %t216, i64 %t217, i64 %t218, i64 %t219, i64 %t220, i64 %t221, i64 %t222, i64 %t223, i64 3)
  store i64 %t224, ptr %local.n3.151
  %t225 = load i64, ptr %local.u0.142
  %t226 = load i64, ptr %local.u1.143
  %t227 = load i64, ptr %local.u2.144
  %t228 = load i64, ptr %local.u3.145
  %t229 = load i64, ptr %local.u4.146
  %t230 = load i64, ptr %local.nu
  %t231 = load i64, ptr %local.dt
  %t232 = load i64, ptr %local.dx
  %t233 = call i64 @"bstep"(i64 %t225, i64 %t226, i64 %t227, i64 %t228, i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 4)
  store i64 %t233, ptr %local.n4.152
  %t234 = load i64, ptr %local.n0.148
  store i64 %t234, ptr %local.u0.142
  %t235 = load i64, ptr %local.n1.149
  store i64 %t235, ptr %local.u1.143
  %t236 = load i64, ptr %local.n2.150
  store i64 %t236, ptr %local.u2.144
  %t237 = load i64, ptr %local.n3.151
  store i64 %t237, ptr %local.u3.145
  %t238 = load i64, ptr %local.n4.152
  store i64 %t238, ptr %local.u4.146
  %t239 = load i64, ptr %local.s.147
  %t240 = add i64 %t239, 1
  store i64 %t240, ptr %local.s.147
  br label %loop8
endloop8:
  %t241 = load i64, ptr %local.which
  %t242 = icmp eq i64 %t241, 0
  %t243 = zext i1 %t242 to i64
  %t244 = icmp ne i64 %t243, 0
  br i1 %t244, label %then9, label %else9
then9:
  %t245 = load i64, ptr %local.u0.142
  ret i64 %t245
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t246 = phi i64 [ 0, %else9_end ]
  %t247 = load i64, ptr %local.which
  %t248 = icmp eq i64 %t247, 1
  %t249 = zext i1 %t248 to i64
  %t250 = icmp ne i64 %t249, 0
  br i1 %t250, label %then10, label %else10
then10:
  %t251 = load i64, ptr %local.u1.143
  ret i64 %t251
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t252 = phi i64 [ 0, %else10_end ]
  %t253 = load i64, ptr %local.which
  %t254 = icmp eq i64 %t253, 2
  %t255 = zext i1 %t254 to i64
  %t256 = icmp ne i64 %t255, 0
  br i1 %t256, label %then11, label %else11
then11:
  %t257 = load i64, ptr %local.u2.144
  ret i64 %t257
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t258 = phi i64 [ 0, %else11_end ]
  %t259 = load i64, ptr %local.which
  %t260 = icmp eq i64 %t259, 3
  %t261 = zext i1 %t260 to i64
  %t262 = icmp ne i64 %t261, 0
  br i1 %t262, label %then12, label %else12
then12:
  %t263 = load i64, ptr %local.u3.145
  ret i64 %t263
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t264 = phi i64 [ 0, %else12_end ]
  %t265 = load i64, ptr %local.u4.146
  ret i64 %t265
}

define i64 @"stability_margin"(i64 %u0, i64 %u1, i64 %u2, i64 %u3, i64 %u4, i64 %eps, i64 %nu, i64 %dt, i64 %dx, i64 %probe) nounwind {
entry:
  %local.a0.266 = alloca i64
  %local.a1.267 = alloca i64
  %local.a2.268 = alloca i64
  %local.a3.269 = alloca i64
  %local.a4.270 = alloca i64
  %local.b0.271 = alloca i64
  %local.b1.272 = alloca i64
  %local.b2.273 = alloca i64
  %local.b3.274 = alloca i64
  %local.b4.275 = alloca i64
  %local.s.276 = alloca i64
  %local.na0.277 = alloca i64
  %local.na1.278 = alloca i64
  %local.na2.279 = alloca i64
  %local.na3.280 = alloca i64
  %local.na4.281 = alloca i64
  %local.nb0.282 = alloca i64
  %local.nb1.283 = alloca i64
  %local.nb2.284 = alloca i64
  %local.nb3.285 = alloca i64
  %local.nb4.286 = alloca i64
  %local.d0.287 = alloca i64
  %local.d1.288 = alloca i64
  %local.d2.289 = alloca i64
  %local.d3.290 = alloca i64
  %local.d4.291 = alloca i64
  %local.divergence.292 = alloca i64
  %local.u0 = alloca i64
  store i64 %u0, ptr %local.u0
  %local.u1 = alloca i64
  store i64 %u1, ptr %local.u1
  %local.u2 = alloca i64
  store i64 %u2, ptr %local.u2
  %local.u3 = alloca i64
  store i64 %u3, ptr %local.u3
  %local.u4 = alloca i64
  store i64 %u4, ptr %local.u4
  %local.eps = alloca i64
  store i64 %eps, ptr %local.eps
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.dx = alloca i64
  store i64 %dx, ptr %local.dx
  %local.probe = alloca i64
  store i64 %probe, ptr %local.probe
  %t293 = load i64, ptr %local.u0
  store i64 %t293, ptr %local.a0.266
  %t294 = load i64, ptr %local.u1
  store i64 %t294, ptr %local.a1.267
  %t295 = load i64, ptr %local.u2
  store i64 %t295, ptr %local.a2.268
  %t296 = load i64, ptr %local.u3
  store i64 %t296, ptr %local.a3.269
  %t297 = load i64, ptr %local.u4
  store i64 %t297, ptr %local.a4.270
  %t298 = load i64, ptr %local.u0
  store i64 %t298, ptr %local.b0.271
  %t299 = load i64, ptr %local.u1
  store i64 %t299, ptr %local.b1.272
  %t300 = load i64, ptr %local.u2
  %t301 = load i64, ptr %local.eps
  %t302 = call i64 @"sx_f64_add"(i64 %t300, i64 %t301)
  store i64 %t302, ptr %local.b2.273
  %t303 = load i64, ptr %local.u3
  store i64 %t303, ptr %local.b3.274
  %t304 = load i64, ptr %local.u4
  store i64 %t304, ptr %local.b4.275
  store i64 0, ptr %local.s.276
  br label %loop13
loop13:
  %t305 = load i64, ptr %local.s.276
  %t306 = load i64, ptr %local.probe
  %t307 = icmp slt i64 %t305, %t306
  %t308 = zext i1 %t307 to i64
  %t309 = icmp ne i64 %t308, 0
  br i1 %t309, label %body13, label %endloop13
body13:
  %t310 = load i64, ptr %local.a0.266
  %t311 = load i64, ptr %local.a1.267
  %t312 = load i64, ptr %local.a2.268
  %t313 = load i64, ptr %local.a3.269
  %t314 = load i64, ptr %local.a4.270
  %t315 = load i64, ptr %local.nu
  %t316 = load i64, ptr %local.dt
  %t317 = load i64, ptr %local.dx
  %t318 = call i64 @"bstep"(i64 %t310, i64 %t311, i64 %t312, i64 %t313, i64 %t314, i64 %t315, i64 %t316, i64 %t317, i64 0)
  store i64 %t318, ptr %local.na0.277
  %t319 = load i64, ptr %local.a0.266
  %t320 = load i64, ptr %local.a1.267
  %t321 = load i64, ptr %local.a2.268
  %t322 = load i64, ptr %local.a3.269
  %t323 = load i64, ptr %local.a4.270
  %t324 = load i64, ptr %local.nu
  %t325 = load i64, ptr %local.dt
  %t326 = load i64, ptr %local.dx
  %t327 = call i64 @"bstep"(i64 %t319, i64 %t320, i64 %t321, i64 %t322, i64 %t323, i64 %t324, i64 %t325, i64 %t326, i64 1)
  store i64 %t327, ptr %local.na1.278
  %t328 = load i64, ptr %local.a0.266
  %t329 = load i64, ptr %local.a1.267
  %t330 = load i64, ptr %local.a2.268
  %t331 = load i64, ptr %local.a3.269
  %t332 = load i64, ptr %local.a4.270
  %t333 = load i64, ptr %local.nu
  %t334 = load i64, ptr %local.dt
  %t335 = load i64, ptr %local.dx
  %t336 = call i64 @"bstep"(i64 %t328, i64 %t329, i64 %t330, i64 %t331, i64 %t332, i64 %t333, i64 %t334, i64 %t335, i64 2)
  store i64 %t336, ptr %local.na2.279
  %t337 = load i64, ptr %local.a0.266
  %t338 = load i64, ptr %local.a1.267
  %t339 = load i64, ptr %local.a2.268
  %t340 = load i64, ptr %local.a3.269
  %t341 = load i64, ptr %local.a4.270
  %t342 = load i64, ptr %local.nu
  %t343 = load i64, ptr %local.dt
  %t344 = load i64, ptr %local.dx
  %t345 = call i64 @"bstep"(i64 %t337, i64 %t338, i64 %t339, i64 %t340, i64 %t341, i64 %t342, i64 %t343, i64 %t344, i64 3)
  store i64 %t345, ptr %local.na3.280
  %t346 = load i64, ptr %local.a0.266
  %t347 = load i64, ptr %local.a1.267
  %t348 = load i64, ptr %local.a2.268
  %t349 = load i64, ptr %local.a3.269
  %t350 = load i64, ptr %local.a4.270
  %t351 = load i64, ptr %local.nu
  %t352 = load i64, ptr %local.dt
  %t353 = load i64, ptr %local.dx
  %t354 = call i64 @"bstep"(i64 %t346, i64 %t347, i64 %t348, i64 %t349, i64 %t350, i64 %t351, i64 %t352, i64 %t353, i64 4)
  store i64 %t354, ptr %local.na4.281
  %t355 = load i64, ptr %local.b0.271
  %t356 = load i64, ptr %local.b1.272
  %t357 = load i64, ptr %local.b2.273
  %t358 = load i64, ptr %local.b3.274
  %t359 = load i64, ptr %local.b4.275
  %t360 = load i64, ptr %local.nu
  %t361 = load i64, ptr %local.dt
  %t362 = load i64, ptr %local.dx
  %t363 = call i64 @"bstep"(i64 %t355, i64 %t356, i64 %t357, i64 %t358, i64 %t359, i64 %t360, i64 %t361, i64 %t362, i64 0)
  store i64 %t363, ptr %local.nb0.282
  %t364 = load i64, ptr %local.b0.271
  %t365 = load i64, ptr %local.b1.272
  %t366 = load i64, ptr %local.b2.273
  %t367 = load i64, ptr %local.b3.274
  %t368 = load i64, ptr %local.b4.275
  %t369 = load i64, ptr %local.nu
  %t370 = load i64, ptr %local.dt
  %t371 = load i64, ptr %local.dx
  %t372 = call i64 @"bstep"(i64 %t364, i64 %t365, i64 %t366, i64 %t367, i64 %t368, i64 %t369, i64 %t370, i64 %t371, i64 1)
  store i64 %t372, ptr %local.nb1.283
  %t373 = load i64, ptr %local.b0.271
  %t374 = load i64, ptr %local.b1.272
  %t375 = load i64, ptr %local.b2.273
  %t376 = load i64, ptr %local.b3.274
  %t377 = load i64, ptr %local.b4.275
  %t378 = load i64, ptr %local.nu
  %t379 = load i64, ptr %local.dt
  %t380 = load i64, ptr %local.dx
  %t381 = call i64 @"bstep"(i64 %t373, i64 %t374, i64 %t375, i64 %t376, i64 %t377, i64 %t378, i64 %t379, i64 %t380, i64 2)
  store i64 %t381, ptr %local.nb2.284
  %t382 = load i64, ptr %local.b0.271
  %t383 = load i64, ptr %local.b1.272
  %t384 = load i64, ptr %local.b2.273
  %t385 = load i64, ptr %local.b3.274
  %t386 = load i64, ptr %local.b4.275
  %t387 = load i64, ptr %local.nu
  %t388 = load i64, ptr %local.dt
  %t389 = load i64, ptr %local.dx
  %t390 = call i64 @"bstep"(i64 %t382, i64 %t383, i64 %t384, i64 %t385, i64 %t386, i64 %t387, i64 %t388, i64 %t389, i64 3)
  store i64 %t390, ptr %local.nb3.285
  %t391 = load i64, ptr %local.b0.271
  %t392 = load i64, ptr %local.b1.272
  %t393 = load i64, ptr %local.b2.273
  %t394 = load i64, ptr %local.b3.274
  %t395 = load i64, ptr %local.b4.275
  %t396 = load i64, ptr %local.nu
  %t397 = load i64, ptr %local.dt
  %t398 = load i64, ptr %local.dx
  %t399 = call i64 @"bstep"(i64 %t391, i64 %t392, i64 %t393, i64 %t394, i64 %t395, i64 %t396, i64 %t397, i64 %t398, i64 4)
  store i64 %t399, ptr %local.nb4.286
  %t400 = load i64, ptr %local.na0.277
  store i64 %t400, ptr %local.a0.266
  %t401 = load i64, ptr %local.na1.278
  store i64 %t401, ptr %local.a1.267
  %t402 = load i64, ptr %local.na2.279
  store i64 %t402, ptr %local.a2.268
  %t403 = load i64, ptr %local.na3.280
  store i64 %t403, ptr %local.a3.269
  %t404 = load i64, ptr %local.na4.281
  store i64 %t404, ptr %local.a4.270
  %t405 = load i64, ptr %local.nb0.282
  store i64 %t405, ptr %local.b0.271
  %t406 = load i64, ptr %local.nb1.283
  store i64 %t406, ptr %local.b1.272
  %t407 = load i64, ptr %local.nb2.284
  store i64 %t407, ptr %local.b2.273
  %t408 = load i64, ptr %local.nb3.285
  store i64 %t408, ptr %local.b3.274
  %t409 = load i64, ptr %local.nb4.286
  store i64 %t409, ptr %local.b4.275
  %t410 = load i64, ptr %local.s.276
  %t411 = add i64 %t410, 1
  store i64 %t411, ptr %local.s.276
  br label %loop13
endloop13:
  %t412 = load i64, ptr %local.a0.266
  %t413 = load i64, ptr %local.b0.271
  %t414 = call i64 @"sx_f64_sub"(i64 %t412, i64 %t413)
  %t415 = load i64, ptr %local.a0.266
  %t416 = load i64, ptr %local.b0.271
  %t417 = call i64 @"sx_f64_sub"(i64 %t415, i64 %t416)
  %t418 = call i64 @"sx_f64_mul"(i64 %t414, i64 %t417)
  store i64 %t418, ptr %local.d0.287
  %t419 = load i64, ptr %local.a1.267
  %t420 = load i64, ptr %local.b1.272
  %t421 = call i64 @"sx_f64_sub"(i64 %t419, i64 %t420)
  %t422 = load i64, ptr %local.a1.267
  %t423 = load i64, ptr %local.b1.272
  %t424 = call i64 @"sx_f64_sub"(i64 %t422, i64 %t423)
  %t425 = call i64 @"sx_f64_mul"(i64 %t421, i64 %t424)
  store i64 %t425, ptr %local.d1.288
  %t426 = load i64, ptr %local.a2.268
  %t427 = load i64, ptr %local.b2.273
  %t428 = call i64 @"sx_f64_sub"(i64 %t426, i64 %t427)
  %t429 = load i64, ptr %local.a2.268
  %t430 = load i64, ptr %local.b2.273
  %t431 = call i64 @"sx_f64_sub"(i64 %t429, i64 %t430)
  %t432 = call i64 @"sx_f64_mul"(i64 %t428, i64 %t431)
  store i64 %t432, ptr %local.d2.289
  %t433 = load i64, ptr %local.a3.269
  %t434 = load i64, ptr %local.b3.274
  %t435 = call i64 @"sx_f64_sub"(i64 %t433, i64 %t434)
  %t436 = load i64, ptr %local.a3.269
  %t437 = load i64, ptr %local.b3.274
  %t438 = call i64 @"sx_f64_sub"(i64 %t436, i64 %t437)
  %t439 = call i64 @"sx_f64_mul"(i64 %t435, i64 %t438)
  store i64 %t439, ptr %local.d3.290
  %t440 = load i64, ptr %local.a4.270
  %t441 = load i64, ptr %local.b4.275
  %t442 = call i64 @"sx_f64_sub"(i64 %t440, i64 %t441)
  %t443 = load i64, ptr %local.a4.270
  %t444 = load i64, ptr %local.b4.275
  %t445 = call i64 @"sx_f64_sub"(i64 %t443, i64 %t444)
  %t446 = call i64 @"sx_f64_mul"(i64 %t442, i64 %t445)
  store i64 %t446, ptr %local.d4.291
  %t447 = load i64, ptr %local.d0.287
  %t448 = load i64, ptr %local.d1.288
  %t449 = call i64 @"sx_f64_add"(i64 %t447, i64 %t448)
  %t450 = load i64, ptr %local.d2.289
  %t451 = call i64 @"sx_f64_add"(i64 %t449, i64 %t450)
  %t452 = load i64, ptr %local.d3.290
  %t453 = call i64 @"sx_f64_add"(i64 %t451, i64 %t452)
  %t454 = load i64, ptr %local.d4.291
  %t455 = call i64 @"sx_f64_add"(i64 %t453, i64 %t454)
  %t456 = call i64 @"sqrt_f64"(i64 %t455)
  store i64 %t456, ptr %local.divergence.292
  %t457 = load i64, ptr %local.divergence.292
  %t458 = load i64, ptr %local.eps
  %t459 = call i64 @"abs_f64"(i64 %t458)
  %t460 = call i64 @"sx_f64_div"(i64 %t457, i64 %t459)
  ret i64 %t460
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.461 = alloca i64
  %local.dt.462 = alloca i64
  %local.dx.463 = alloca i64
  %local.eps.464 = alloca i64
  %local.probe.465 = alloca i64
  %local.prev_m.466 = alloca i64
  %local.prev_dm.467 = alloca i64
  %local.t.468 = alloca i64
  %local.s0.469 = alloca i64
  %local.s1.470 = alloca i64
  %local.s2.471 = alloca i64
  %local.s3.472 = alloca i64
  %local.s4.473 = alloca i64
  %local.m.474 = alloca i64
  %local.dm.475 = alloca i64
  %local.d2m.476 = alloca i64
  %local.s0.477 = alloca i64
  %local.s1.478 = alloca i64
  %local.s2.479 = alloca i64
  %local.s3.480 = alloca i64
  %local.s4.481 = alloca i64
  %local.m_small.482 = alloca i64
  %local.m_med.483 = alloca i64
  %local.m_big.484 = alloca i64
  %local.ratio1.485 = alloca i64
  %local.ratio2.486 = alloca i64
  %local.s0.487 = alloca i64
  %local.s1.488 = alloca i64
  %local.s2.489 = alloca i64
  %local.s3.490 = alloca i64
  %local.s4.491 = alloca i64
  %local.e.492 = alloca i64
  %local.best_info.493 = alloca i64
  %local.best_eps.494 = alloca i64
  %local.sweep.495 = alloca i64
  %local.m_val.496 = alloca i64
  %local.info.497 = alloca i64
  %t498 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.19)
  %t499 = ptrtoint ptr %t498 to i64
  %t500 = inttoptr i64 %t499 to ptr
  call void @intrinsic_println(ptr %t500)
  %t501 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.20)
  %t502 = ptrtoint ptr %t501 to i64
  %t503 = inttoptr i64 %t502 to ptr
  call void @intrinsic_println(ptr %t503)
  %t504 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.21)
  %t505 = ptrtoint ptr %t504 to i64
  %t506 = inttoptr i64 %t505 to ptr
  call void @intrinsic_println(ptr %t506)
  %t507 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.22)
  %t508 = ptrtoint ptr %t507 to i64
  %t509 = inttoptr i64 %t508 to ptr
  call void @intrinsic_println(ptr %t509)
  %t510 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.23)
  %t511 = ptrtoint ptr %t510 to i64
  %t512 = inttoptr i64 %t511 to ptr
  call void @intrinsic_println(ptr %t512)
  %t513 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.24)
  %t514 = ptrtoint ptr %t513 to i64
  %t515 = inttoptr i64 %t514 to ptr
  call void @intrinsic_println(ptr %t515)
  %t516 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.25)
  store i64 %t516, ptr %local.nu.461
  %t517 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.26)
  store i64 %t517, ptr %local.dt.462
  %t518 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.27)
  store i64 %t518, ptr %local.dx.463
  %t519 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.28)
  store i64 %t519, ptr %local.eps.464
  store i64 200, ptr %local.probe.465
  %t520 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.29)
  %t521 = ptrtoint ptr %t520 to i64
  %t522 = inttoptr i64 %t521 to ptr
  call void @intrinsic_println(ptr %t522)
  %t523 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.30)
  %t524 = ptrtoint ptr %t523 to i64
  %t525 = inttoptr i64 %t524 to ptr
  call void @intrinsic_println(ptr %t525)
  %t526 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.31)
  %t527 = ptrtoint ptr %t526 to i64
  %t528 = inttoptr i64 %t527 to ptr
  call void @intrinsic_println(ptr %t528)
  %t529 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.32)
  %t530 = ptrtoint ptr %t529 to i64
  %t531 = inttoptr i64 %t530 to ptr
  call void @intrinsic_println(ptr %t531)
  %t532 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.33)
  %t533 = ptrtoint ptr %t532 to i64
  %t534 = inttoptr i64 %t533 to ptr
  call void @intrinsic_println(ptr %t534)
  %t535 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.34)
  %t536 = ptrtoint ptr %t535 to i64
  %t537 = inttoptr i64 %t536 to ptr
  call void @intrinsic_println(ptr %t537)
  %t538 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.35)
  store i64 %t538, ptr %local.prev_m.466
  %t539 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.36)
  store i64 %t539, ptr %local.prev_dm.467
  store i64 0, ptr %local.t.468
  br label %loop14
loop14:
  %t540 = load i64, ptr %local.t.468
  %t541 = icmp sle i64 %t540, 12000
  %t542 = zext i1 %t541 to i64
  %t543 = icmp ne i64 %t542, 0
  br i1 %t543, label %body14, label %endloop14
body14:
  %t544 = load i64, ptr %local.t.468
  %t545 = load i64, ptr %local.nu.461
  %t546 = load i64, ptr %local.dt.462
  %t547 = load i64, ptr %local.dx.463
  %t548 = call i64 @"evolve"(i64 %t544, i64 %t545, i64 %t546, i64 %t547, i64 0)
  store i64 %t548, ptr %local.s0.469
  %t549 = load i64, ptr %local.t.468
  %t550 = load i64, ptr %local.nu.461
  %t551 = load i64, ptr %local.dt.462
  %t552 = load i64, ptr %local.dx.463
  %t553 = call i64 @"evolve"(i64 %t549, i64 %t550, i64 %t551, i64 %t552, i64 1)
  store i64 %t553, ptr %local.s1.470
  %t554 = load i64, ptr %local.t.468
  %t555 = load i64, ptr %local.nu.461
  %t556 = load i64, ptr %local.dt.462
  %t557 = load i64, ptr %local.dx.463
  %t558 = call i64 @"evolve"(i64 %t554, i64 %t555, i64 %t556, i64 %t557, i64 2)
  store i64 %t558, ptr %local.s2.471
  %t559 = load i64, ptr %local.t.468
  %t560 = load i64, ptr %local.nu.461
  %t561 = load i64, ptr %local.dt.462
  %t562 = load i64, ptr %local.dx.463
  %t563 = call i64 @"evolve"(i64 %t559, i64 %t560, i64 %t561, i64 %t562, i64 3)
  store i64 %t563, ptr %local.s3.472
  %t564 = load i64, ptr %local.t.468
  %t565 = load i64, ptr %local.nu.461
  %t566 = load i64, ptr %local.dt.462
  %t567 = load i64, ptr %local.dx.463
  %t568 = call i64 @"evolve"(i64 %t564, i64 %t565, i64 %t566, i64 %t567, i64 4)
  store i64 %t568, ptr %local.s4.473
  %t569 = load i64, ptr %local.s0.469
  %t570 = load i64, ptr %local.s1.470
  %t571 = load i64, ptr %local.s2.471
  %t572 = load i64, ptr %local.s3.472
  %t573 = load i64, ptr %local.s4.473
  %t574 = load i64, ptr %local.eps.464
  %t575 = load i64, ptr %local.nu.461
  %t576 = load i64, ptr %local.dt.462
  %t577 = load i64, ptr %local.dx.463
  %t578 = load i64, ptr %local.probe.465
  %t579 = call i64 @"stability_margin"(i64 %t569, i64 %t570, i64 %t571, i64 %t572, i64 %t573, i64 %t574, i64 %t575, i64 %t576, i64 %t577, i64 %t578)
  store i64 %t579, ptr %local.m.474
  %t580 = load i64, ptr %local.m.474
  %t581 = load i64, ptr %local.prev_m.466
  %t582 = call i64 @"sx_f64_sub"(i64 %t580, i64 %t581)
  store i64 %t582, ptr %local.dm.475
  %t583 = load i64, ptr %local.dm.475
  %t584 = load i64, ptr %local.prev_dm.467
  %t585 = call i64 @"sx_f64_sub"(i64 %t583, i64 %t584)
  store i64 %t585, ptr %local.d2m.476
  %t586 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.37)
  %t587 = ptrtoint ptr %t586 to i64
  %t588 = inttoptr i64 %t587 to ptr
  call void @intrinsic_print(ptr %t588)
  %t589 = load i64, ptr %local.t.468
  call void @print_i64(i64 %t589)
  %t590 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.38)
  %t591 = ptrtoint ptr %t590 to i64
  %t592 = inttoptr i64 %t591 to ptr
  call void @intrinsic_print(ptr %t592)
  %t593 = load i64, ptr %local.m.474
  %t594 = call i64 @"print_f64"(i64 %t593)
  %t595 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.39)
  %t596 = ptrtoint ptr %t595 to i64
  %t597 = inttoptr i64 %t596 to ptr
  call void @intrinsic_print(ptr %t597)
  %t598 = load i64, ptr %local.dm.475
  %t599 = call i64 @"print_f64"(i64 %t598)
  %t600 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.40)
  %t601 = ptrtoint ptr %t600 to i64
  %t602 = inttoptr i64 %t601 to ptr
  call void @intrinsic_print(ptr %t602)
  %t603 = load i64, ptr %local.d2m.476
  %t604 = call i64 @"print_f64"(i64 %t603)
  %t605 = load i64, ptr %local.dm.475
  %t606 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.41)
  %t607 = call i64 @"sx_f64_gt"(i64 %t605, i64 %t606)
  %t608 = icmp ne i64 %t607, 0
  br i1 %t608, label %then15, label %else15
then15:
  %t609 = load i64, ptr %local.d2m.476
  %t610 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.42)
  %t611 = call i64 @"sx_f64_gt"(i64 %t609, i64 %t610)
  %t612 = icmp ne i64 %t611, 0
  br i1 %t612, label %then16, label %else16
then16:
  %t613 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.43)
  %t614 = ptrtoint ptr %t613 to i64
  %t615 = inttoptr i64 %t614 to ptr
  call void @intrinsic_println(ptr %t615)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t616 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.44)
  %t617 = ptrtoint ptr %t616 to i64
  %t618 = inttoptr i64 %t617 to ptr
  call void @intrinsic_println(ptr %t618)
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t619 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t620 = load i64, ptr %local.dm.475
  %t621 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.45)
  %t622 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.46)
  %t623 = call i64 @"sx_f64_sub"(i64 %t621, i64 %t622)
  %t624 = call i64 @"sx_f64_lt"(i64 %t620, i64 %t623)
  %t625 = icmp ne i64 %t624, 0
  br i1 %t625, label %then17, label %else17
then17:
  %t626 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.47)
  %t627 = ptrtoint ptr %t626 to i64
  %t628 = inttoptr i64 %t627 to ptr
  call void @intrinsic_println(ptr %t628)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t629 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.48)
  %t630 = ptrtoint ptr %t629 to i64
  %t631 = inttoptr i64 %t630 to ptr
  call void @intrinsic_println(ptr %t631)
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t632 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t633 = phi i64 [ %t619, %then15_end ], [ %t632, %else15_end ]
  %t634 = load i64, ptr %local.dm.475
  store i64 %t634, ptr %local.prev_dm.467
  %t635 = load i64, ptr %local.m.474
  store i64 %t635, ptr %local.prev_m.466
  %t636 = load i64, ptr %local.t.468
  %t637 = add i64 %t636, 2000
  store i64 %t637, ptr %local.t.468
  br label %loop14
endloop14:
  %t638 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.49)
  %t639 = ptrtoint ptr %t638 to i64
  %t640 = inttoptr i64 %t639 to ptr
  call void @intrinsic_println(ptr %t640)
  %t641 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.50)
  %t642 = ptrtoint ptr %t641 to i64
  %t643 = inttoptr i64 %t642 to ptr
  call void @intrinsic_println(ptr %t643)
  %t644 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.51)
  %t645 = ptrtoint ptr %t644 to i64
  %t646 = inttoptr i64 %t645 to ptr
  call void @intrinsic_println(ptr %t646)
  %t647 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.52)
  %t648 = ptrtoint ptr %t647 to i64
  %t649 = inttoptr i64 %t648 to ptr
  call void @intrinsic_println(ptr %t649)
  %t650 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.53)
  %t651 = ptrtoint ptr %t650 to i64
  %t652 = inttoptr i64 %t651 to ptr
  call void @intrinsic_println(ptr %t652)
  %t653 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.54)
  %t654 = ptrtoint ptr %t653 to i64
  %t655 = inttoptr i64 %t654 to ptr
  call void @intrinsic_println(ptr %t655)
  store i64 0, ptr %local.t.468
  br label %loop18
loop18:
  %t656 = load i64, ptr %local.t.468
  %t657 = icmp sle i64 %t656, 10000
  %t658 = zext i1 %t657 to i64
  %t659 = icmp ne i64 %t658, 0
  br i1 %t659, label %body18, label %endloop18
body18:
  %t660 = load i64, ptr %local.t.468
  %t661 = load i64, ptr %local.nu.461
  %t662 = load i64, ptr %local.dt.462
  %t663 = load i64, ptr %local.dx.463
  %t664 = call i64 @"evolve"(i64 %t660, i64 %t661, i64 %t662, i64 %t663, i64 0)
  store i64 %t664, ptr %local.s0.477
  %t665 = load i64, ptr %local.t.468
  %t666 = load i64, ptr %local.nu.461
  %t667 = load i64, ptr %local.dt.462
  %t668 = load i64, ptr %local.dx.463
  %t669 = call i64 @"evolve"(i64 %t665, i64 %t666, i64 %t667, i64 %t668, i64 1)
  store i64 %t669, ptr %local.s1.478
  %t670 = load i64, ptr %local.t.468
  %t671 = load i64, ptr %local.nu.461
  %t672 = load i64, ptr %local.dt.462
  %t673 = load i64, ptr %local.dx.463
  %t674 = call i64 @"evolve"(i64 %t670, i64 %t671, i64 %t672, i64 %t673, i64 2)
  store i64 %t674, ptr %local.s2.479
  %t675 = load i64, ptr %local.t.468
  %t676 = load i64, ptr %local.nu.461
  %t677 = load i64, ptr %local.dt.462
  %t678 = load i64, ptr %local.dx.463
  %t679 = call i64 @"evolve"(i64 %t675, i64 %t676, i64 %t677, i64 %t678, i64 3)
  store i64 %t679, ptr %local.s3.480
  %t680 = load i64, ptr %local.t.468
  %t681 = load i64, ptr %local.nu.461
  %t682 = load i64, ptr %local.dt.462
  %t683 = load i64, ptr %local.dx.463
  %t684 = call i64 @"evolve"(i64 %t680, i64 %t681, i64 %t682, i64 %t683, i64 4)
  store i64 %t684, ptr %local.s4.481
  %t685 = load i64, ptr %local.s0.477
  %t686 = load i64, ptr %local.s1.478
  %t687 = load i64, ptr %local.s2.479
  %t688 = load i64, ptr %local.s3.480
  %t689 = load i64, ptr %local.s4.481
  %t690 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.55)
  %t691 = load i64, ptr %local.nu.461
  %t692 = load i64, ptr %local.dt.462
  %t693 = load i64, ptr %local.dx.463
  %t694 = load i64, ptr %local.probe.465
  %t695 = call i64 @"stability_margin"(i64 %t685, i64 %t686, i64 %t687, i64 %t688, i64 %t689, i64 %t690, i64 %t691, i64 %t692, i64 %t693, i64 %t694)
  store i64 %t695, ptr %local.m_small.482
  %t696 = load i64, ptr %local.s0.477
  %t697 = load i64, ptr %local.s1.478
  %t698 = load i64, ptr %local.s2.479
  %t699 = load i64, ptr %local.s3.480
  %t700 = load i64, ptr %local.s4.481
  %t701 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.56)
  %t702 = load i64, ptr %local.nu.461
  %t703 = load i64, ptr %local.dt.462
  %t704 = load i64, ptr %local.dx.463
  %t705 = load i64, ptr %local.probe.465
  %t706 = call i64 @"stability_margin"(i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 %t700, i64 %t701, i64 %t702, i64 %t703, i64 %t704, i64 %t705)
  store i64 %t706, ptr %local.m_med.483
  %t707 = load i64, ptr %local.s0.477
  %t708 = load i64, ptr %local.s1.478
  %t709 = load i64, ptr %local.s2.479
  %t710 = load i64, ptr %local.s3.480
  %t711 = load i64, ptr %local.s4.481
  %t712 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.57)
  %t713 = load i64, ptr %local.nu.461
  %t714 = load i64, ptr %local.dt.462
  %t715 = load i64, ptr %local.dx.463
  %t716 = load i64, ptr %local.probe.465
  %t717 = call i64 @"stability_margin"(i64 %t707, i64 %t708, i64 %t709, i64 %t710, i64 %t711, i64 %t712, i64 %t713, i64 %t714, i64 %t715, i64 %t716)
  store i64 %t717, ptr %local.m_big.484
  %t718 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.58)
  %t719 = ptrtoint ptr %t718 to i64
  %t720 = inttoptr i64 %t719 to ptr
  call void @intrinsic_print(ptr %t720)
  %t721 = load i64, ptr %local.t.468
  call void @print_i64(i64 %t721)
  %t722 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.59)
  %t723 = ptrtoint ptr %t722 to i64
  %t724 = inttoptr i64 %t723 to ptr
  call void @intrinsic_print(ptr %t724)
  %t725 = load i64, ptr %local.m_small.482
  %t726 = call i64 @"print_f64"(i64 %t725)
  %t727 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.60)
  %t728 = ptrtoint ptr %t727 to i64
  %t729 = inttoptr i64 %t728 to ptr
  call void @intrinsic_print(ptr %t729)
  %t730 = load i64, ptr %local.m_med.483
  %t731 = call i64 @"print_f64"(i64 %t730)
  %t732 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.61)
  %t733 = ptrtoint ptr %t732 to i64
  %t734 = inttoptr i64 %t733 to ptr
  call void @intrinsic_print(ptr %t734)
  %t735 = load i64, ptr %local.m_big.484
  %t736 = call i64 @"print_f64"(i64 %t735)
  %t737 = load i64, ptr %local.m_small.482
  %t738 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.62)
  %t739 = call i64 @"sx_f64_gt"(i64 %t737, i64 %t738)
  %t740 = icmp ne i64 %t739, 0
  br i1 %t740, label %then19, label %else19
then19:
  %t741 = load i64, ptr %local.m_med.483
  %t742 = load i64, ptr %local.m_small.482
  %t743 = call i64 @"sx_f64_div"(i64 %t741, i64 %t742)
  store i64 %t743, ptr %local.ratio1.485
  %t744 = load i64, ptr %local.m_big.484
  %t745 = load i64, ptr %local.m_med.483
  %t746 = call i64 @"sx_f64_div"(i64 %t744, i64 %t745)
  store i64 %t746, ptr %local.ratio2.486
  %t747 = load i64, ptr %local.ratio2.486
  %t748 = load i64, ptr %local.ratio1.485
  %t749 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.63)
  %t750 = call i64 @"sx_f64_mul"(i64 %t748, i64 %t749)
  %t751 = call i64 @"sx_f64_gt"(i64 %t747, i64 %t750)
  %t752 = icmp ne i64 %t751, 0
  br i1 %t752, label %then20, label %else20
then20:
  %t753 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.64)
  %t754 = ptrtoint ptr %t753 to i64
  %t755 = inttoptr i64 %t754 to ptr
  call void @intrinsic_println(ptr %t755)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t756 = load i64, ptr %local.ratio2.486
  %t757 = load i64, ptr %local.ratio1.485
  %t758 = call i64 @"sx_f64_sub"(i64 %t756, i64 %t757)
  %t759 = call i64 @"abs_f64"(i64 %t758)
  %t760 = load i64, ptr %local.ratio1.485
  %t761 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.65)
  %t762 = call i64 @"sx_f64_mul"(i64 %t760, i64 %t761)
  %t763 = call i64 @"sx_f64_lt"(i64 %t759, i64 %t762)
  %t764 = icmp ne i64 %t763, 0
  br i1 %t764, label %then21, label %else21
then21:
  %t765 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.66)
  %t766 = ptrtoint ptr %t765 to i64
  %t767 = inttoptr i64 %t766 to ptr
  call void @intrinsic_println(ptr %t767)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t768 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.67)
  %t769 = ptrtoint ptr %t768 to i64
  %t770 = inttoptr i64 %t769 to ptr
  call void @intrinsic_println(ptr %t770)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t771 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t772 = phi i64 [ 0, %then20_end ], [ %t771, %else20_end ]
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t773 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.68)
  %t774 = ptrtoint ptr %t773 to i64
  %t775 = inttoptr i64 %t774 to ptr
  call void @intrinsic_println(ptr %t775)
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t776 = phi i64 [ %t772, %then19_end ], [ 0, %else19_end ]
  %t777 = load i64, ptr %local.t.468
  %t778 = add i64 %t777, 2500
  store i64 %t778, ptr %local.t.468
  br label %loop18
endloop18:
  %t779 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.69)
  %t780 = ptrtoint ptr %t779 to i64
  %t781 = inttoptr i64 %t780 to ptr
  call void @intrinsic_println(ptr %t781)
  %t782 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.70)
  %t783 = ptrtoint ptr %t782 to i64
  %t784 = inttoptr i64 %t783 to ptr
  call void @intrinsic_println(ptr %t784)
  %t785 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.71)
  %t786 = ptrtoint ptr %t785 to i64
  %t787 = inttoptr i64 %t786 to ptr
  call void @intrinsic_println(ptr %t787)
  %t788 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.72)
  %t789 = ptrtoint ptr %t788 to i64
  %t790 = inttoptr i64 %t789 to ptr
  call void @intrinsic_println(ptr %t790)
  %t791 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.73)
  %t792 = ptrtoint ptr %t791 to i64
  %t793 = inttoptr i64 %t792 to ptr
  call void @intrinsic_println(ptr %t793)
  %t794 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.74)
  %t795 = ptrtoint ptr %t794 to i64
  %t796 = inttoptr i64 %t795 to ptr
  call void @intrinsic_println(ptr %t796)
  %t797 = load i64, ptr %local.nu.461
  %t798 = load i64, ptr %local.dt.462
  %t799 = load i64, ptr %local.dx.463
  %t800 = call i64 @"evolve"(i64 5000, i64 %t797, i64 %t798, i64 %t799, i64 0)
  store i64 %t800, ptr %local.s0.487
  %t801 = load i64, ptr %local.nu.461
  %t802 = load i64, ptr %local.dt.462
  %t803 = load i64, ptr %local.dx.463
  %t804 = call i64 @"evolve"(i64 5000, i64 %t801, i64 %t802, i64 %t803, i64 1)
  store i64 %t804, ptr %local.s1.488
  %t805 = load i64, ptr %local.nu.461
  %t806 = load i64, ptr %local.dt.462
  %t807 = load i64, ptr %local.dx.463
  %t808 = call i64 @"evolve"(i64 5000, i64 %t805, i64 %t806, i64 %t807, i64 2)
  store i64 %t808, ptr %local.s2.489
  %t809 = load i64, ptr %local.nu.461
  %t810 = load i64, ptr %local.dt.462
  %t811 = load i64, ptr %local.dx.463
  %t812 = call i64 @"evolve"(i64 5000, i64 %t809, i64 %t810, i64 %t811, i64 3)
  store i64 %t812, ptr %local.s3.490
  %t813 = load i64, ptr %local.nu.461
  %t814 = load i64, ptr %local.dt.462
  %t815 = load i64, ptr %local.dx.463
  %t816 = call i64 @"evolve"(i64 5000, i64 %t813, i64 %t814, i64 %t815, i64 4)
  store i64 %t816, ptr %local.s4.491
  %t817 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.75)
  %t818 = ptrtoint ptr %t817 to i64
  %t819 = inttoptr i64 %t818 to ptr
  call void @intrinsic_println(ptr %t819)
  %t820 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.76)
  store i64 %t820, ptr %local.e.492
  %t821 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.77)
  store i64 %t821, ptr %local.best_info.493
  %t822 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.78)
  store i64 %t822, ptr %local.best_eps.494
  store i64 0, ptr %local.sweep.495
  br label %loop22
loop22:
  %t823 = load i64, ptr %local.sweep.495
  %t824 = icmp slt i64 %t823, 8
  %t825 = zext i1 %t824 to i64
  %t826 = icmp ne i64 %t825, 0
  br i1 %t826, label %body22, label %endloop22
body22:
  %t827 = load i64, ptr %local.s0.487
  %t828 = load i64, ptr %local.s1.488
  %t829 = load i64, ptr %local.s2.489
  %t830 = load i64, ptr %local.s3.490
  %t831 = load i64, ptr %local.s4.491
  %t832 = load i64, ptr %local.e.492
  %t833 = load i64, ptr %local.nu.461
  %t834 = load i64, ptr %local.dt.462
  %t835 = load i64, ptr %local.dx.463
  %t836 = load i64, ptr %local.probe.465
  %t837 = call i64 @"stability_margin"(i64 %t827, i64 %t828, i64 %t829, i64 %t830, i64 %t831, i64 %t832, i64 %t833, i64 %t834, i64 %t835, i64 %t836)
  store i64 %t837, ptr %local.m_val.496
  %t838 = load i64, ptr %local.m_val.496
  store i64 %t838, ptr %local.info.497
  %t839 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.79)
  %t840 = ptrtoint ptr %t839 to i64
  %t841 = inttoptr i64 %t840 to ptr
  call void @intrinsic_print(ptr %t841)
  %t842 = load i64, ptr %local.e.492
  %t843 = call i64 @"print_f64"(i64 %t842)
  %t844 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.80)
  %t845 = ptrtoint ptr %t844 to i64
  %t846 = inttoptr i64 %t845 to ptr
  call void @intrinsic_print(ptr %t846)
  %t847 = load i64, ptr %local.m_val.496
  %t848 = call i64 @"print_f64"(i64 %t847)
  %t849 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.81)
  %t850 = ptrtoint ptr %t849 to i64
  %t851 = inttoptr i64 %t850 to ptr
  call void @intrinsic_print(ptr %t851)
  %t852 = load i64, ptr %local.info.497
  %t853 = call i64 @"print_f64"(i64 %t852)
  %t854 = load i64, ptr %local.info.497
  %t855 = load i64, ptr %local.best_info.493
  %t856 = call i64 @"sx_f64_gt"(i64 %t854, i64 %t855)
  %t857 = icmp ne i64 %t856, 0
  br i1 %t857, label %then23, label %else23
then23:
  %t858 = load i64, ptr %local.info.497
  store i64 %t858, ptr %local.best_info.493
  %t859 = load i64, ptr %local.e.492
  store i64 %t859, ptr %local.best_eps.494
  %t860 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.82)
  %t861 = ptrtoint ptr %t860 to i64
  %t862 = inttoptr i64 %t861 to ptr
  call void @intrinsic_println(ptr %t862)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t863 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.83)
  %t864 = ptrtoint ptr %t863 to i64
  %t865 = inttoptr i64 %t864 to ptr
  call void @intrinsic_println(ptr %t865)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t866 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t867 = load i64, ptr %local.e.492
  %t868 = call i64 @f64_parse(ptr @.str.exp_chaos_agent.84)
  %t869 = call i64 @"sx_f64_mul"(i64 %t867, i64 %t868)
  store i64 %t869, ptr %local.e.492
  %t870 = load i64, ptr %local.sweep.495
  %t871 = add i64 %t870, 1
  store i64 %t871, ptr %local.sweep.495
  br label %loop22
endloop22:
  %t872 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.85)
  %t873 = ptrtoint ptr %t872 to i64
  %t874 = inttoptr i64 %t873 to ptr
  call void @intrinsic_print(ptr %t874)
  %t875 = load i64, ptr %local.best_eps.494
  %t876 = call i64 @"print_f64"(i64 %t875)
  %t877 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.86)
  %t878 = ptrtoint ptr %t877 to i64
  %t879 = inttoptr i64 %t878 to ptr
  call void @intrinsic_println(ptr %t879)
  %t880 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.87)
  %t881 = ptrtoint ptr %t880 to i64
  %t882 = inttoptr i64 %t881 to ptr
  call void @intrinsic_println(ptr %t882)
  %t883 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.88)
  %t884 = ptrtoint ptr %t883 to i64
  %t885 = inttoptr i64 %t884 to ptr
  call void @intrinsic_println(ptr %t885)
  %t886 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.89)
  %t887 = ptrtoint ptr %t886 to i64
  %t888 = inttoptr i64 %t887 to ptr
  call void @intrinsic_println(ptr %t888)
  %t889 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.90)
  %t890 = ptrtoint ptr %t889 to i64
  %t891 = inttoptr i64 %t890 to ptr
  call void @intrinsic_println(ptr %t891)
  %t892 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.91)
  %t893 = ptrtoint ptr %t892 to i64
  %t894 = inttoptr i64 %t893 to ptr
  call void @intrinsic_println(ptr %t894)
  %t895 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.92)
  %t896 = ptrtoint ptr %t895 to i64
  %t897 = inttoptr i64 %t896 to ptr
  call void @intrinsic_println(ptr %t897)
  %t898 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.93)
  %t899 = ptrtoint ptr %t898 to i64
  %t900 = inttoptr i64 %t899 to ptr
  call void @intrinsic_println(ptr %t900)
  %t901 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.94)
  %t902 = ptrtoint ptr %t901 to i64
  %t903 = inttoptr i64 %t902 to ptr
  call void @intrinsic_println(ptr %t903)
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.95)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_println(ptr %t906)
  %t907 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.96)
  %t908 = ptrtoint ptr %t907 to i64
  %t909 = inttoptr i64 %t908 to ptr
  call void @intrinsic_println(ptr %t909)
  %t910 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.97)
  %t911 = ptrtoint ptr %t910 to i64
  %t912 = inttoptr i64 %t911 to ptr
  call void @intrinsic_println(ptr %t912)
  %t913 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.98)
  %t914 = ptrtoint ptr %t913 to i64
  %t915 = inttoptr i64 %t914 to ptr
  call void @intrinsic_println(ptr %t915)
  %t916 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.99)
  %t917 = ptrtoint ptr %t916 to i64
  %t918 = inttoptr i64 %t917 to ptr
  call void @intrinsic_println(ptr %t918)
  %t919 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.100)
  %t920 = ptrtoint ptr %t919 to i64
  %t921 = inttoptr i64 %t920 to ptr
  call void @intrinsic_println(ptr %t921)
  %t922 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.101)
  %t923 = ptrtoint ptr %t922 to i64
  %t924 = inttoptr i64 %t923 to ptr
  call void @intrinsic_println(ptr %t924)
  %t925 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.102)
  %t926 = ptrtoint ptr %t925 to i64
  %t927 = inttoptr i64 %t926 to ptr
  call void @intrinsic_println(ptr %t927)
  %t928 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.103)
  %t929 = ptrtoint ptr %t928 to i64
  %t930 = inttoptr i64 %t929 to ptr
  call void @intrinsic_println(ptr %t930)
  %t931 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.104)
  %t932 = ptrtoint ptr %t931 to i64
  %t933 = inttoptr i64 %t932 to ptr
  call void @intrinsic_println(ptr %t933)
  %t934 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.105)
  %t935 = ptrtoint ptr %t934 to i64
  %t936 = inttoptr i64 %t935 to ptr
  call void @intrinsic_println(ptr %t936)
  %t937 = call ptr @intrinsic_string_new(ptr @.str.exp_chaos_agent.106)
  %t938 = ptrtoint ptr %t937 to i64
  %t939 = inttoptr i64 %t938 to ptr
  call void @intrinsic_println(ptr %t939)
  ret i64 0
}


; String constants
@.str.exp_chaos_agent.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.8 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_chaos_agent.9 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.12 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_chaos_agent.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.14 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_chaos_agent.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.16 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_chaos_agent.17 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_chaos_agent.18 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_chaos_agent.19 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_chaos_agent.20 = private unnamed_addr constant [45 x i8] c"#  THE SKEPTICAL AGENT OF CHAOS            #\00"
@.str.exp_chaos_agent.21 = private unnamed_addr constant [46 x i8] c"#  Stability margin as dual number          #\00"
@.str.exp_chaos_agent.22 = private unnamed_addr constant [47 x i8] c"#  M, dM/dt, dM/deps — full hierarchy      #\00"
@.str.exp_chaos_agent.23 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_chaos_agent.24 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.25 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_chaos_agent.26 = private unnamed_addr constant [8 x i8] c"0.00005\00"
@.str.exp_chaos_agent.27 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_chaos_agent.28 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_chaos_agent.29 = private unnamed_addr constant [41 x i8] c"=== M(t): Stability Margin Over Time ===\00"
@.str.exp_chaos_agent.30 = private unnamed_addr constant [45 x i8] c"  M = divergence / epsilon after probe_steps\00"
@.str.exp_chaos_agent.31 = private unnamed_addr constant [24 x i8] c"  dM/dt = M(t) - M(t-1)\00"
@.str.exp_chaos_agent.32 = private unnamed_addr constant [30 x i8] c"  d²M/dt² = dM(t) - dM(t-1)\00"
@.str.exp_chaos_agent.33 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.34 = private unnamed_addr constant [63 x i8] c"  Time     M(t)         dM/dt        d²M/dt²      Prediction\00"
@.str.exp_chaos_agent.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.37 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.38 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_chaos_agent.39 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.40 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.41 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.42 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.43 = private unnamed_addr constant [30 x i8] c"  ACCELERATING toward blow-up\00"
@.str.exp_chaos_agent.44 = private unnamed_addr constant [37 x i8] c"  APPROACHING blow-up (decelerating)\00"
@.str.exp_chaos_agent.45 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.46 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_chaos_agent.47 = private unnamed_addr constant [14 x i8] c"  STABILISING\00"
@.str.exp_chaos_agent.48 = private unnamed_addr constant [9 x i8] c"  STABLE\00"
@.str.exp_chaos_agent.49 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.50 = private unnamed_addr constant [37 x i8] c"=== dM/deps: How Response Scales ===\00"
@.str.exp_chaos_agent.51 = private unnamed_addr constant [54 x i8] c"  Linear scaling = stable (perturbation theory works)\00"
@.str.exp_chaos_agent.52 = private unnamed_addr constant [47 x i8] c"  Superlinear = nonlinear instability imminent\00"
@.str.exp_chaos_agent.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.54 = private unnamed_addr constant [58 x i8] c"  Time    M(eps=0.001)  M(eps=0.01)  M(eps=0.1)   Scaling\00"
@.str.exp_chaos_agent.55 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_chaos_agent.56 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_chaos_agent.57 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_chaos_agent.58 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.59 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_chaos_agent.60 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.61 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.62 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_chaos_agent.63 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_chaos_agent.64 = private unnamed_addr constant [38 x i8] c"  SUPERLINEAR (nonlinear instability)\00"
@.str.exp_chaos_agent.65 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_chaos_agent.66 = private unnamed_addr constant [25 x i8] c"  LINEAR (stable regime)\00"
@.str.exp_chaos_agent.67 = private unnamed_addr constant [25 x i8] c"  SUBLINEAR (saturating)\00"
@.str.exp_chaos_agent.68 = private unnamed_addr constant [16 x i8] c"  (M too small)\00"
@.str.exp_chaos_agent.69 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.70 = private unnamed_addr constant [30 x i8] c"=== Optimal Probe Epsilon ===\00"
@.str.exp_chaos_agent.71 = private unnamed_addr constant [46 x i8] c"  The 'information' from a probe is |dM/deps|\00"
@.str.exp_chaos_agent.72 = private unnamed_addr constant [52 x i8] c"  Too small: noise dominates. Too large: nonlinear.\00"
@.str.exp_chaos_agent.73 = private unnamed_addr constant [54 x i8] c"  Optimal: maximum information per unit perturbation.\00"
@.str.exp_chaos_agent.74 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.75 = private unnamed_addr constant [40 x i8] c"  epsilon    M(eps)       M/eps²(info)\00"
@.str.exp_chaos_agent.76 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_chaos_agent.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_chaos_agent.78 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_chaos_agent.79 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.80 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.81 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_chaos_agent.82 = private unnamed_addr constant [4 x i8] c"  *\00"
@.str.exp_chaos_agent.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.84 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_chaos_agent.85 = private unnamed_addr constant [20 x i8] c"  Optimal epsilon: \00"
@.str.exp_chaos_agent.86 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.87 = private unnamed_addr constant [54 x i8] c"  This epsilon maximises the stability margin signal.\00"
@.str.exp_chaos_agent.88 = private unnamed_addr constant [51 x i8] c"  In a dual-number system, this would be learnable\00"
@.str.exp_chaos_agent.89 = private unnamed_addr constant [39 x i8] c"  via meta-gradient on the probe loss.\00"
@.str.exp_chaos_agent.90 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_chaos_agent.91 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_chaos_agent.92 = private unnamed_addr constant [45 x i8] c"#  THE HIERARCHY:                          #\00"
@.str.exp_chaos_agent.93 = private unnamed_addr constant [45 x i8] c"#  Level 0: theta (params)                 #\00"
@.str.exp_chaos_agent.94 = private unnamed_addr constant [45 x i8] c"#  Level 1: alpha (interaction matrix)     #\00"
@.str.exp_chaos_agent.95 = private unnamed_addr constant [45 x i8] c"#  Level 2: S (convergence score)          #\00"
@.str.exp_chaos_agent.96 = private unnamed_addr constant [45 x i8] c"#  Level 3: S', S'' (PID control)          #\00"
@.str.exp_chaos_agent.97 = private unnamed_addr constant [45 x i8] c"#  Level 4: M (stability margin)           #\00"
@.str.exp_chaos_agent.98 = private unnamed_addr constant [45 x i8] c"#  Level 5: dM/dt (fragility evolution)    #\00"
@.str.exp_chaos_agent.99 = private unnamed_addr constant [45 x i8] c"#  Level 6: dM/deps (instability type)     #\00"
@.str.exp_chaos_agent.100 = private unnamed_addr constant [46 x i8] c"#  Level 7: eps* (optimal probe - learnable)#\00"
@.str.exp_chaos_agent.101 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_chaos_agent.102 = private unnamed_addr constant [45 x i8] c"#  Every level is a dual number.           #\00"
@.str.exp_chaos_agent.103 = private unnamed_addr constant [45 x i8] c"#  Every level's derivative is computable. #\00"
@.str.exp_chaos_agent.104 = private unnamed_addr constant [45 x i8] c"#  The skeptical agent probes, measures,   #\00"
@.str.exp_chaos_agent.105 = private unnamed_addr constant [47 x i8] c"#  predicts, and adapts — all via AD.      #\00"
@.str.exp_chaos_agent.106 = private unnamed_addr constant [45 x i8] c"############################################\00"
