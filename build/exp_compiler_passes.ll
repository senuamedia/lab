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
  %t1 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"dot6"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %b0, i64 %b1, i64 %b2, i64 %b3, i64 %b4, i64 %b5) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.a4 = alloca i64
  store i64 %a4, ptr %local.a4
  %local.a5 = alloca i64
  store i64 %a5, ptr %local.a5
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %local.b4 = alloca i64
  store i64 %b4, ptr %local.b4
  %local.b5 = alloca i64
  store i64 %b5, ptr %local.b5
  %t22 = load i64, ptr %local.a0
  %t23 = load i64, ptr %local.b0
  %t24 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t23)
  %t25 = load i64, ptr %local.a1
  %t26 = load i64, ptr %local.b1
  %t27 = call i64 @"sx_f64_mul"(i64 %t25, i64 %t26)
  %t28 = call i64 @"sx_f64_add"(i64 %t24, i64 %t27)
  %t29 = load i64, ptr %local.a2
  %t30 = load i64, ptr %local.b2
  %t31 = call i64 @"sx_f64_mul"(i64 %t29, i64 %t30)
  %t32 = call i64 @"sx_f64_add"(i64 %t28, i64 %t31)
  %t33 = load i64, ptr %local.a3
  %t34 = load i64, ptr %local.b3
  %t35 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t34)
  %t36 = call i64 @"sx_f64_add"(i64 %t32, i64 %t35)
  %t37 = load i64, ptr %local.a4
  %t38 = load i64, ptr %local.b4
  %t39 = call i64 @"sx_f64_mul"(i64 %t37, i64 %t38)
  %t40 = call i64 @"sx_f64_add"(i64 %t36, i64 %t39)
  %t41 = load i64, ptr %local.a5
  %t42 = load i64, ptr %local.b5
  %t43 = call i64 @"sx_f64_mul"(i64 %t41, i64 %t42)
  %t44 = call i64 @"sx_f64_add"(i64 %t40, i64 %t43)
  ret i64 %t44
}

define i64 @"norm6"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.a4 = alloca i64
  store i64 %a4, ptr %local.a4
  %local.a5 = alloca i64
  store i64 %a5, ptr %local.a5
  %t45 = load i64, ptr %local.a0
  %t46 = load i64, ptr %local.a1
  %t47 = load i64, ptr %local.a2
  %t48 = load i64, ptr %local.a3
  %t49 = load i64, ptr %local.a4
  %t50 = load i64, ptr %local.a5
  %t51 = load i64, ptr %local.a0
  %t52 = load i64, ptr %local.a1
  %t53 = load i64, ptr %local.a2
  %t54 = load i64, ptr %local.a3
  %t55 = load i64, ptr %local.a4
  %t56 = load i64, ptr %local.a5
  %t57 = call i64 @"dot6"(i64 %t45, i64 %t46, i64 %t47, i64 %t48, i64 %t49, i64 %t50, i64 %t51, i64 %t52, i64 %t53, i64 %t54, i64 %t55, i64 %t56)
  %t58 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.2)
  %t59 = call i64 @"sx_f64_add"(i64 %t57, i64 %t58)
  %t60 = call i64 @"sqrt_f64"(i64 %t59)
  ret i64 %t60
}

define i64 @"cosine6"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %b0, i64 %b1, i64 %b2, i64 %b3, i64 %b4, i64 %b5) nounwind {
entry:
  %local.d.61 = alloca i64
  %local.na.62 = alloca i64
  %local.nb.63 = alloca i64
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.a4 = alloca i64
  store i64 %a4, ptr %local.a4
  %local.a5 = alloca i64
  store i64 %a5, ptr %local.a5
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %local.b4 = alloca i64
  store i64 %b4, ptr %local.b4
  %local.b5 = alloca i64
  store i64 %b5, ptr %local.b5
  %t64 = load i64, ptr %local.a0
  %t65 = load i64, ptr %local.a1
  %t66 = load i64, ptr %local.a2
  %t67 = load i64, ptr %local.a3
  %t68 = load i64, ptr %local.a4
  %t69 = load i64, ptr %local.a5
  %t70 = load i64, ptr %local.b0
  %t71 = load i64, ptr %local.b1
  %t72 = load i64, ptr %local.b2
  %t73 = load i64, ptr %local.b3
  %t74 = load i64, ptr %local.b4
  %t75 = load i64, ptr %local.b5
  %t76 = call i64 @"dot6"(i64 %t64, i64 %t65, i64 %t66, i64 %t67, i64 %t68, i64 %t69, i64 %t70, i64 %t71, i64 %t72, i64 %t73, i64 %t74, i64 %t75)
  store i64 %t76, ptr %local.d.61
  %t77 = load i64, ptr %local.a0
  %t78 = load i64, ptr %local.a1
  %t79 = load i64, ptr %local.a2
  %t80 = load i64, ptr %local.a3
  %t81 = load i64, ptr %local.a4
  %t82 = load i64, ptr %local.a5
  %t83 = call i64 @"norm6"(i64 %t77, i64 %t78, i64 %t79, i64 %t80, i64 %t81, i64 %t82)
  store i64 %t83, ptr %local.na.62
  %t84 = load i64, ptr %local.b0
  %t85 = load i64, ptr %local.b1
  %t86 = load i64, ptr %local.b2
  %t87 = load i64, ptr %local.b3
  %t88 = load i64, ptr %local.b4
  %t89 = load i64, ptr %local.b5
  %t90 = call i64 @"norm6"(i64 %t84, i64 %t85, i64 %t86, i64 %t87, i64 %t88, i64 %t89)
  store i64 %t90, ptr %local.nb.63
  %t91 = load i64, ptr %local.d.61
  %t92 = load i64, ptr %local.na.62
  %t93 = load i64, ptr %local.nb.63
  %t94 = call i64 @"sx_f64_mul"(i64 %t92, i64 %t93)
  %t95 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.3)
  %t96 = call i64 @"sx_f64_add"(i64 %t94, i64 %t95)
  %t97 = call i64 @"sx_f64_div"(i64 %t91, i64 %t96)
  ret i64 %t97
}

define i64 @"loss_inline"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.d0.98 = alloca i64
  %local.d1.99 = alloca i64
  %local.d2.100 = alloca i64
  %local.d3.101 = alloca i64
  %local.d4.102 = alloca i64
  %local.d5.103 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t104 = load i64, ptr %local.w0
  %t105 = load i64, ptr %local.w0
  %t106 = call i64 @"sx_f64_mul"(i64 %t104, i64 %t105)
  store i64 %t106, ptr %local.d0.98
  %t107 = load i64, ptr %local.w1
  %t108 = load i64, ptr %local.w1
  %t109 = call i64 @"sx_f64_mul"(i64 %t107, i64 %t108)
  store i64 %t109, ptr %local.d1.99
  %t110 = load i64, ptr %local.w2
  %t111 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.4)
  %t112 = call i64 @"sx_f64_add"(i64 %t110, i64 %t111)
  %t113 = load i64, ptr %local.w2
  %t114 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.5)
  %t115 = call i64 @"sx_f64_add"(i64 %t113, i64 %t114)
  %t116 = call i64 @"sx_f64_mul"(i64 %t112, i64 %t115)
  store i64 %t116, ptr %local.d2.100
  %t117 = load i64, ptr %local.w3
  %t118 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.6)
  %t119 = call i64 @"sx_f64_sub"(i64 %t117, i64 %t118)
  %t120 = load i64, ptr %local.w3
  %t121 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.7)
  %t122 = call i64 @"sx_f64_sub"(i64 %t120, i64 %t121)
  %t123 = call i64 @"sx_f64_mul"(i64 %t119, i64 %t122)
  store i64 %t123, ptr %local.d3.101
  %t124 = load i64, ptr %local.w4
  %t125 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.8)
  %t126 = call i64 @"sx_f64_sub"(i64 %t124, i64 %t125)
  %t127 = load i64, ptr %local.w4
  %t128 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.9)
  %t129 = call i64 @"sx_f64_sub"(i64 %t127, i64 %t128)
  %t130 = call i64 @"sx_f64_mul"(i64 %t126, i64 %t129)
  store i64 %t130, ptr %local.d4.102
  %t131 = load i64, ptr %local.w5
  %t132 = load i64, ptr %local.w5
  %t133 = call i64 @"sx_f64_mul"(i64 %t131, i64 %t132)
  store i64 %t133, ptr %local.d5.103
  %t134 = load i64, ptr %local.d0.98
  %t135 = load i64, ptr %local.d1.99
  %t136 = call i64 @"sx_f64_add"(i64 %t134, i64 %t135)
  %t137 = load i64, ptr %local.d2.100
  %t138 = call i64 @"sx_f64_add"(i64 %t136, i64 %t137)
  %t139 = load i64, ptr %local.d3.101
  %t140 = call i64 @"sx_f64_add"(i64 %t138, i64 %t139)
  %t141 = load i64, ptr %local.d4.102
  %t142 = call i64 @"sx_f64_add"(i64 %t140, i64 %t141)
  %t143 = load i64, ptr %local.d5.103
  %t144 = call i64 @"sx_f64_add"(i64 %t142, i64 %t143)
  ret i64 %t144
}

define i64 @"loss_unroll"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.d0.145 = alloca i64
  %local.d1.146 = alloca i64
  %local.d2.147 = alloca i64
  %local.d3.148 = alloca i64
  %local.d4.149 = alloca i64
  %local.d5.150 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t151 = load i64, ptr %local.w0
  %t152 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.10)
  %t153 = call i64 @"sx_f64_sub"(i64 %t151, i64 %t152)
  %t154 = load i64, ptr %local.w0
  %t155 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.11)
  %t156 = call i64 @"sx_f64_sub"(i64 %t154, i64 %t155)
  %t157 = call i64 @"sx_f64_mul"(i64 %t153, i64 %t156)
  store i64 %t157, ptr %local.d0.145
  %t158 = load i64, ptr %local.w1
  %t159 = load i64, ptr %local.w1
  %t160 = call i64 @"sx_f64_mul"(i64 %t158, i64 %t159)
  store i64 %t160, ptr %local.d1.146
  %t161 = load i64, ptr %local.w2
  %t162 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.12)
  %t163 = call i64 @"sx_f64_add"(i64 %t161, i64 %t162)
  %t164 = load i64, ptr %local.w2
  %t165 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.13)
  %t166 = call i64 @"sx_f64_add"(i64 %t164, i64 %t165)
  %t167 = call i64 @"sx_f64_mul"(i64 %t163, i64 %t166)
  store i64 %t167, ptr %local.d2.147
  %t168 = load i64, ptr %local.w3
  %t169 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.14)
  %t170 = call i64 @"sx_f64_sub"(i64 %t168, i64 %t169)
  %t171 = load i64, ptr %local.w3
  %t172 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.15)
  %t173 = call i64 @"sx_f64_sub"(i64 %t171, i64 %t172)
  %t174 = call i64 @"sx_f64_mul"(i64 %t170, i64 %t173)
  store i64 %t174, ptr %local.d3.148
  %t175 = load i64, ptr %local.w4
  %t176 = load i64, ptr %local.w4
  %t177 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t176)
  store i64 %t177, ptr %local.d4.149
  %t178 = load i64, ptr %local.w5
  %t179 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.16)
  %t180 = call i64 @"sx_f64_add"(i64 %t178, i64 %t179)
  %t181 = load i64, ptr %local.w5
  %t182 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.17)
  %t183 = call i64 @"sx_f64_add"(i64 %t181, i64 %t182)
  %t184 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t183)
  store i64 %t184, ptr %local.d5.150
  %t185 = load i64, ptr %local.d0.145
  %t186 = load i64, ptr %local.d1.146
  %t187 = call i64 @"sx_f64_add"(i64 %t185, i64 %t186)
  %t188 = load i64, ptr %local.d2.147
  %t189 = call i64 @"sx_f64_add"(i64 %t187, i64 %t188)
  %t190 = load i64, ptr %local.d3.148
  %t191 = call i64 @"sx_f64_add"(i64 %t189, i64 %t190)
  %t192 = load i64, ptr %local.d4.149
  %t193 = call i64 @"sx_f64_add"(i64 %t191, i64 %t192)
  %t194 = load i64, ptr %local.d5.150
  %t195 = call i64 @"sx_f64_add"(i64 %t193, i64 %t194)
  ret i64 %t195
}

define i64 @"loss_constfold"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.d0.196 = alloca i64
  %local.d1.197 = alloca i64
  %local.d2.198 = alloca i64
  %local.d3.199 = alloca i64
  %local.d4.200 = alloca i64
  %local.d5.201 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t202 = load i64, ptr %local.w0
  %t203 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.18)
  %t204 = call i64 @"sx_f64_add"(i64 %t202, i64 %t203)
  %t205 = load i64, ptr %local.w0
  %t206 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.19)
  %t207 = call i64 @"sx_f64_add"(i64 %t205, i64 %t206)
  %t208 = call i64 @"sx_f64_mul"(i64 %t204, i64 %t207)
  store i64 %t208, ptr %local.d0.196
  %t209 = load i64, ptr %local.w1
  %t210 = load i64, ptr %local.w1
  %t211 = call i64 @"sx_f64_mul"(i64 %t209, i64 %t210)
  store i64 %t211, ptr %local.d1.197
  %t212 = load i64, ptr %local.w2
  %t213 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.20)
  %t214 = call i64 @"sx_f64_add"(i64 %t212, i64 %t213)
  %t215 = load i64, ptr %local.w2
  %t216 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.21)
  %t217 = call i64 @"sx_f64_add"(i64 %t215, i64 %t216)
  %t218 = call i64 @"sx_f64_mul"(i64 %t214, i64 %t217)
  store i64 %t218, ptr %local.d2.198
  %t219 = load i64, ptr %local.w3
  %t220 = load i64, ptr %local.w3
  %t221 = call i64 @"sx_f64_mul"(i64 %t219, i64 %t220)
  store i64 %t221, ptr %local.d3.199
  %t222 = load i64, ptr %local.w4
  %t223 = load i64, ptr %local.w4
  %t224 = call i64 @"sx_f64_mul"(i64 %t222, i64 %t223)
  store i64 %t224, ptr %local.d4.200
  %t225 = load i64, ptr %local.w5
  %t226 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.22)
  %t227 = call i64 @"sx_f64_add"(i64 %t225, i64 %t226)
  %t228 = load i64, ptr %local.w5
  %t229 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.23)
  %t230 = call i64 @"sx_f64_add"(i64 %t228, i64 %t229)
  %t231 = call i64 @"sx_f64_mul"(i64 %t227, i64 %t230)
  store i64 %t231, ptr %local.d5.201
  %t232 = load i64, ptr %local.d0.196
  %t233 = load i64, ptr %local.d1.197
  %t234 = call i64 @"sx_f64_add"(i64 %t232, i64 %t233)
  %t235 = load i64, ptr %local.d2.198
  %t236 = call i64 @"sx_f64_add"(i64 %t234, i64 %t235)
  %t237 = load i64, ptr %local.d3.199
  %t238 = call i64 @"sx_f64_add"(i64 %t236, i64 %t237)
  %t239 = load i64, ptr %local.d4.200
  %t240 = call i64 @"sx_f64_add"(i64 %t238, i64 %t239)
  %t241 = load i64, ptr %local.d5.201
  %t242 = call i64 @"sx_f64_add"(i64 %t240, i64 %t241)
  ret i64 %t242
}

define i64 @"loss_simd"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.d0.243 = alloca i64
  %local.d1.244 = alloca i64
  %local.d2.245 = alloca i64
  %local.d3.246 = alloca i64
  %local.d4.247 = alloca i64
  %local.d5.248 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t249 = load i64, ptr %local.w0
  %t250 = load i64, ptr %local.w0
  %t251 = call i64 @"sx_f64_mul"(i64 %t249, i64 %t250)
  store i64 %t251, ptr %local.d0.243
  %t252 = load i64, ptr %local.w1
  %t253 = load i64, ptr %local.w1
  %t254 = call i64 @"sx_f64_mul"(i64 %t252, i64 %t253)
  store i64 %t254, ptr %local.d1.244
  %t255 = load i64, ptr %local.w2
  %t256 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.24)
  %t257 = call i64 @"sx_f64_add"(i64 %t255, i64 %t256)
  %t258 = load i64, ptr %local.w2
  %t259 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.25)
  %t260 = call i64 @"sx_f64_add"(i64 %t258, i64 %t259)
  %t261 = call i64 @"sx_f64_mul"(i64 %t257, i64 %t260)
  store i64 %t261, ptr %local.d2.245
  %t262 = load i64, ptr %local.w3
  %t263 = load i64, ptr %local.w3
  %t264 = call i64 @"sx_f64_mul"(i64 %t262, i64 %t263)
  store i64 %t264, ptr %local.d3.246
  %t265 = load i64, ptr %local.w4
  %t266 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.26)
  %t267 = call i64 @"sx_f64_sub"(i64 %t265, i64 %t266)
  %t268 = load i64, ptr %local.w4
  %t269 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.27)
  %t270 = call i64 @"sx_f64_sub"(i64 %t268, i64 %t269)
  %t271 = call i64 @"sx_f64_mul"(i64 %t267, i64 %t270)
  store i64 %t271, ptr %local.d4.247
  %t272 = load i64, ptr %local.w5
  %t273 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.28)
  %t274 = call i64 @"sx_f64_add"(i64 %t272, i64 %t273)
  %t275 = load i64, ptr %local.w5
  %t276 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.29)
  %t277 = call i64 @"sx_f64_add"(i64 %t275, i64 %t276)
  %t278 = call i64 @"sx_f64_mul"(i64 %t274, i64 %t277)
  store i64 %t278, ptr %local.d5.248
  %t279 = load i64, ptr %local.d0.243
  %t280 = load i64, ptr %local.d1.244
  %t281 = call i64 @"sx_f64_add"(i64 %t279, i64 %t280)
  %t282 = load i64, ptr %local.d2.245
  %t283 = call i64 @"sx_f64_add"(i64 %t281, i64 %t282)
  %t284 = load i64, ptr %local.d3.246
  %t285 = call i64 @"sx_f64_add"(i64 %t283, i64 %t284)
  %t286 = load i64, ptr %local.d4.247
  %t287 = call i64 @"sx_f64_add"(i64 %t285, i64 %t286)
  %t288 = load i64, ptr %local.d5.248
  %t289 = call i64 @"sx_f64_add"(i64 %t287, i64 %t288)
  ret i64 %t289
}

define i64 @"combined_loss"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t290 = load i64, ptr %local.w0
  %t291 = load i64, ptr %local.w1
  %t292 = load i64, ptr %local.w2
  %t293 = load i64, ptr %local.w3
  %t294 = load i64, ptr %local.w4
  %t295 = load i64, ptr %local.w5
  %t296 = call i64 @"loss_inline"(i64 %t290, i64 %t291, i64 %t292, i64 %t293, i64 %t294, i64 %t295)
  %t297 = load i64, ptr %local.w0
  %t298 = load i64, ptr %local.w1
  %t299 = load i64, ptr %local.w2
  %t300 = load i64, ptr %local.w3
  %t301 = load i64, ptr %local.w4
  %t302 = load i64, ptr %local.w5
  %t303 = call i64 @"loss_unroll"(i64 %t297, i64 %t298, i64 %t299, i64 %t300, i64 %t301, i64 %t302)
  %t304 = call i64 @"sx_f64_add"(i64 %t296, i64 %t303)
  %t305 = load i64, ptr %local.w0
  %t306 = load i64, ptr %local.w1
  %t307 = load i64, ptr %local.w2
  %t308 = load i64, ptr %local.w3
  %t309 = load i64, ptr %local.w4
  %t310 = load i64, ptr %local.w5
  %t311 = call i64 @"loss_constfold"(i64 %t305, i64 %t306, i64 %t307, i64 %t308, i64 %t309, i64 %t310)
  %t312 = call i64 @"sx_f64_add"(i64 %t304, i64 %t311)
  %t313 = load i64, ptr %local.w0
  %t314 = load i64, ptr %local.w1
  %t315 = load i64, ptr %local.w2
  %t316 = load i64, ptr %local.w3
  %t317 = load i64, ptr %local.w4
  %t318 = load i64, ptr %local.w5
  %t319 = call i64 @"loss_simd"(i64 %t313, i64 %t314, i64 %t315, i64 %t316, i64 %t317, i64 %t318)
  %t320 = call i64 @"sx_f64_add"(i64 %t312, i64 %t319)
  ret i64 %t320
}

define i64 @"grad_inline"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %dim) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t321 = load i64, ptr %local.dim
  %t322 = icmp eq i64 %t321, 0
  %t323 = zext i1 %t322 to i64
  %t324 = icmp ne i64 %t323, 0
  br i1 %t324, label %then3, label %else3
then3:
  %t325 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.30)
  %t326 = load i64, ptr %local.w0
  %t327 = call i64 @"sx_f64_mul"(i64 %t325, i64 %t326)
  ret i64 %t327
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t328 = phi i64 [ 0, %else3_end ]
  %t329 = load i64, ptr %local.dim
  %t330 = icmp eq i64 %t329, 1
  %t331 = zext i1 %t330 to i64
  %t332 = icmp ne i64 %t331, 0
  br i1 %t332, label %then4, label %else4
then4:
  %t333 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.31)
  %t334 = load i64, ptr %local.w1
  %t335 = call i64 @"sx_f64_mul"(i64 %t333, i64 %t334)
  ret i64 %t335
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t336 = phi i64 [ 0, %else4_end ]
  %t337 = load i64, ptr %local.dim
  %t338 = icmp eq i64 %t337, 2
  %t339 = zext i1 %t338 to i64
  %t340 = icmp ne i64 %t339, 0
  br i1 %t340, label %then5, label %else5
then5:
  %t341 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.32)
  %t342 = load i64, ptr %local.w2
  %t343 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.33)
  %t344 = call i64 @"sx_f64_add"(i64 %t342, i64 %t343)
  %t345 = call i64 @"sx_f64_mul"(i64 %t341, i64 %t344)
  ret i64 %t345
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t346 = phi i64 [ 0, %else5_end ]
  %t347 = load i64, ptr %local.dim
  %t348 = icmp eq i64 %t347, 3
  %t349 = zext i1 %t348 to i64
  %t350 = icmp ne i64 %t349, 0
  br i1 %t350, label %then6, label %else6
then6:
  %t351 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.34)
  %t352 = load i64, ptr %local.w3
  %t353 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.35)
  %t354 = call i64 @"sx_f64_sub"(i64 %t352, i64 %t353)
  %t355 = call i64 @"sx_f64_mul"(i64 %t351, i64 %t354)
  ret i64 %t355
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t356 = phi i64 [ 0, %else6_end ]
  %t357 = load i64, ptr %local.dim
  %t358 = icmp eq i64 %t357, 4
  %t359 = zext i1 %t358 to i64
  %t360 = icmp ne i64 %t359, 0
  br i1 %t360, label %then7, label %else7
then7:
  %t361 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.36)
  %t362 = load i64, ptr %local.w4
  %t363 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.37)
  %t364 = call i64 @"sx_f64_sub"(i64 %t362, i64 %t363)
  %t365 = call i64 @"sx_f64_mul"(i64 %t361, i64 %t364)
  ret i64 %t365
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t366 = phi i64 [ 0, %else7_end ]
  %t367 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.38)
  %t368 = load i64, ptr %local.w5
  %t369 = call i64 @"sx_f64_mul"(i64 %t367, i64 %t368)
  ret i64 %t369
}

define i64 @"grad_unroll"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %dim) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t370 = load i64, ptr %local.dim
  %t371 = icmp eq i64 %t370, 0
  %t372 = zext i1 %t371 to i64
  %t373 = icmp ne i64 %t372, 0
  br i1 %t373, label %then8, label %else8
then8:
  %t374 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.39)
  %t375 = load i64, ptr %local.w0
  %t376 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.40)
  %t377 = call i64 @"sx_f64_sub"(i64 %t375, i64 %t376)
  %t378 = call i64 @"sx_f64_mul"(i64 %t374, i64 %t377)
  ret i64 %t378
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t379 = phi i64 [ 0, %else8_end ]
  %t380 = load i64, ptr %local.dim
  %t381 = icmp eq i64 %t380, 1
  %t382 = zext i1 %t381 to i64
  %t383 = icmp ne i64 %t382, 0
  br i1 %t383, label %then9, label %else9
then9:
  %t384 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.41)
  %t385 = load i64, ptr %local.w1
  %t386 = call i64 @"sx_f64_mul"(i64 %t384, i64 %t385)
  ret i64 %t386
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t387 = phi i64 [ 0, %else9_end ]
  %t388 = load i64, ptr %local.dim
  %t389 = icmp eq i64 %t388, 2
  %t390 = zext i1 %t389 to i64
  %t391 = icmp ne i64 %t390, 0
  br i1 %t391, label %then10, label %else10
then10:
  %t392 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.42)
  %t393 = load i64, ptr %local.w2
  %t394 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.43)
  %t395 = call i64 @"sx_f64_add"(i64 %t393, i64 %t394)
  %t396 = call i64 @"sx_f64_mul"(i64 %t392, i64 %t395)
  ret i64 %t396
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t397 = phi i64 [ 0, %else10_end ]
  %t398 = load i64, ptr %local.dim
  %t399 = icmp eq i64 %t398, 3
  %t400 = zext i1 %t399 to i64
  %t401 = icmp ne i64 %t400, 0
  br i1 %t401, label %then11, label %else11
then11:
  %t402 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.44)
  %t403 = load i64, ptr %local.w3
  %t404 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.45)
  %t405 = call i64 @"sx_f64_sub"(i64 %t403, i64 %t404)
  %t406 = call i64 @"sx_f64_mul"(i64 %t402, i64 %t405)
  ret i64 %t406
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t407 = phi i64 [ 0, %else11_end ]
  %t408 = load i64, ptr %local.dim
  %t409 = icmp eq i64 %t408, 4
  %t410 = zext i1 %t409 to i64
  %t411 = icmp ne i64 %t410, 0
  br i1 %t411, label %then12, label %else12
then12:
  %t412 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.46)
  %t413 = load i64, ptr %local.w4
  %t414 = call i64 @"sx_f64_mul"(i64 %t412, i64 %t413)
  ret i64 %t414
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t415 = phi i64 [ 0, %else12_end ]
  %t416 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.47)
  %t417 = load i64, ptr %local.w5
  %t418 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.48)
  %t419 = call i64 @"sx_f64_add"(i64 %t417, i64 %t418)
  %t420 = call i64 @"sx_f64_mul"(i64 %t416, i64 %t419)
  ret i64 %t420
}

define i64 @"grad_constfold"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %dim) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t421 = load i64, ptr %local.dim
  %t422 = icmp eq i64 %t421, 0
  %t423 = zext i1 %t422 to i64
  %t424 = icmp ne i64 %t423, 0
  br i1 %t424, label %then13, label %else13
then13:
  %t425 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.49)
  %t426 = load i64, ptr %local.w0
  %t427 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.50)
  %t428 = call i64 @"sx_f64_add"(i64 %t426, i64 %t427)
  %t429 = call i64 @"sx_f64_mul"(i64 %t425, i64 %t428)
  ret i64 %t429
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t430 = phi i64 [ 0, %else13_end ]
  %t431 = load i64, ptr %local.dim
  %t432 = icmp eq i64 %t431, 1
  %t433 = zext i1 %t432 to i64
  %t434 = icmp ne i64 %t433, 0
  br i1 %t434, label %then14, label %else14
then14:
  %t435 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.51)
  %t436 = load i64, ptr %local.w1
  %t437 = call i64 @"sx_f64_mul"(i64 %t435, i64 %t436)
  ret i64 %t437
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t438 = phi i64 [ 0, %else14_end ]
  %t439 = load i64, ptr %local.dim
  %t440 = icmp eq i64 %t439, 2
  %t441 = zext i1 %t440 to i64
  %t442 = icmp ne i64 %t441, 0
  br i1 %t442, label %then15, label %else15
then15:
  %t443 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.52)
  %t444 = load i64, ptr %local.w2
  %t445 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.53)
  %t446 = call i64 @"sx_f64_add"(i64 %t444, i64 %t445)
  %t447 = call i64 @"sx_f64_mul"(i64 %t443, i64 %t446)
  ret i64 %t447
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t448 = phi i64 [ 0, %else15_end ]
  %t449 = load i64, ptr %local.dim
  %t450 = icmp eq i64 %t449, 3
  %t451 = zext i1 %t450 to i64
  %t452 = icmp ne i64 %t451, 0
  br i1 %t452, label %then16, label %else16
then16:
  %t453 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.54)
  %t454 = load i64, ptr %local.w3
  %t455 = call i64 @"sx_f64_mul"(i64 %t453, i64 %t454)
  ret i64 %t455
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t456 = phi i64 [ 0, %else16_end ]
  %t457 = load i64, ptr %local.dim
  %t458 = icmp eq i64 %t457, 4
  %t459 = zext i1 %t458 to i64
  %t460 = icmp ne i64 %t459, 0
  br i1 %t460, label %then17, label %else17
then17:
  %t461 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.55)
  %t462 = load i64, ptr %local.w4
  %t463 = call i64 @"sx_f64_mul"(i64 %t461, i64 %t462)
  ret i64 %t463
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t464 = phi i64 [ 0, %else17_end ]
  %t465 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.56)
  %t466 = load i64, ptr %local.w5
  %t467 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.57)
  %t468 = call i64 @"sx_f64_add"(i64 %t466, i64 %t467)
  %t469 = call i64 @"sx_f64_mul"(i64 %t465, i64 %t468)
  ret i64 %t469
}

define i64 @"grad_simd"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %dim) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t470 = load i64, ptr %local.dim
  %t471 = icmp eq i64 %t470, 0
  %t472 = zext i1 %t471 to i64
  %t473 = icmp ne i64 %t472, 0
  br i1 %t473, label %then18, label %else18
then18:
  %t474 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.58)
  %t475 = load i64, ptr %local.w0
  %t476 = call i64 @"sx_f64_mul"(i64 %t474, i64 %t475)
  ret i64 %t476
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t477 = phi i64 [ 0, %else18_end ]
  %t478 = load i64, ptr %local.dim
  %t479 = icmp eq i64 %t478, 1
  %t480 = zext i1 %t479 to i64
  %t481 = icmp ne i64 %t480, 0
  br i1 %t481, label %then19, label %else19
then19:
  %t482 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.59)
  %t483 = load i64, ptr %local.w1
  %t484 = call i64 @"sx_f64_mul"(i64 %t482, i64 %t483)
  ret i64 %t484
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t485 = phi i64 [ 0, %else19_end ]
  %t486 = load i64, ptr %local.dim
  %t487 = icmp eq i64 %t486, 2
  %t488 = zext i1 %t487 to i64
  %t489 = icmp ne i64 %t488, 0
  br i1 %t489, label %then20, label %else20
then20:
  %t490 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.60)
  %t491 = load i64, ptr %local.w2
  %t492 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.61)
  %t493 = call i64 @"sx_f64_add"(i64 %t491, i64 %t492)
  %t494 = call i64 @"sx_f64_mul"(i64 %t490, i64 %t493)
  ret i64 %t494
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t495 = phi i64 [ 0, %else20_end ]
  %t496 = load i64, ptr %local.dim
  %t497 = icmp eq i64 %t496, 3
  %t498 = zext i1 %t497 to i64
  %t499 = icmp ne i64 %t498, 0
  br i1 %t499, label %then21, label %else21
then21:
  %t500 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.62)
  %t501 = load i64, ptr %local.w3
  %t502 = call i64 @"sx_f64_mul"(i64 %t500, i64 %t501)
  ret i64 %t502
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t503 = phi i64 [ 0, %else21_end ]
  %t504 = load i64, ptr %local.dim
  %t505 = icmp eq i64 %t504, 4
  %t506 = zext i1 %t505 to i64
  %t507 = icmp ne i64 %t506, 0
  br i1 %t507, label %then22, label %else22
then22:
  %t508 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.63)
  %t509 = load i64, ptr %local.w4
  %t510 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.64)
  %t511 = call i64 @"sx_f64_sub"(i64 %t509, i64 %t510)
  %t512 = call i64 @"sx_f64_mul"(i64 %t508, i64 %t511)
  ret i64 %t512
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t513 = phi i64 [ 0, %else22_end ]
  %t514 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.65)
  %t515 = load i64, ptr %local.w5
  %t516 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.66)
  %t517 = call i64 @"sx_f64_add"(i64 %t515, i64 %t516)
  %t518 = call i64 @"sx_f64_mul"(i64 %t514, i64 %t517)
  ret i64 %t518
}

define i64 @"project_1d"(i64 %gi_d, i64 %gi0, i64 %gi1, i64 %gi2, i64 %gi3, i64 %gi4, i64 %gi5, i64 %gj0, i64 %gj1, i64 %gj2, i64 %gj3, i64 %gj4, i64 %gj5, i64 %gj_d, i64 %alpha) nounwind {
entry:
  %local.cos_val.519 = alloca i64
  %local.scale.520 = alloca i64
  %local.gj_sq.521 = alloca i64
  %local.proj_coeff.522 = alloca i64
  %local.gi_d = alloca i64
  store i64 %gi_d, ptr %local.gi_d
  %local.gi0 = alloca i64
  store i64 %gi0, ptr %local.gi0
  %local.gi1 = alloca i64
  store i64 %gi1, ptr %local.gi1
  %local.gi2 = alloca i64
  store i64 %gi2, ptr %local.gi2
  %local.gi3 = alloca i64
  store i64 %gi3, ptr %local.gi3
  %local.gi4 = alloca i64
  store i64 %gi4, ptr %local.gi4
  %local.gi5 = alloca i64
  store i64 %gi5, ptr %local.gi5
  %local.gj0 = alloca i64
  store i64 %gj0, ptr %local.gj0
  %local.gj1 = alloca i64
  store i64 %gj1, ptr %local.gj1
  %local.gj2 = alloca i64
  store i64 %gj2, ptr %local.gj2
  %local.gj3 = alloca i64
  store i64 %gj3, ptr %local.gj3
  %local.gj4 = alloca i64
  store i64 %gj4, ptr %local.gj4
  %local.gj5 = alloca i64
  store i64 %gj5, ptr %local.gj5
  %local.gj_d = alloca i64
  store i64 %gj_d, ptr %local.gj_d
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %t523 = load i64, ptr %local.gi0
  %t524 = load i64, ptr %local.gi1
  %t525 = load i64, ptr %local.gi2
  %t526 = load i64, ptr %local.gi3
  %t527 = load i64, ptr %local.gi4
  %t528 = load i64, ptr %local.gi5
  %t529 = load i64, ptr %local.gj0
  %t530 = load i64, ptr %local.gj1
  %t531 = load i64, ptr %local.gj2
  %t532 = load i64, ptr %local.gj3
  %t533 = load i64, ptr %local.gj4
  %t534 = load i64, ptr %local.gj5
  %t535 = call i64 @"cosine6"(i64 %t523, i64 %t524, i64 %t525, i64 %t526, i64 %t527, i64 %t528, i64 %t529, i64 %t530, i64 %t531, i64 %t532, i64 %t533, i64 %t534)
  store i64 %t535, ptr %local.cos_val.519
  %t536 = load i64, ptr %local.cos_val.519
  %t537 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.67)
  %t538 = call i64 @"sx_f64_ge"(i64 %t536, i64 %t537)
  %t539 = icmp ne i64 %t538, 0
  br i1 %t539, label %then23, label %else23
then23:
  %t540 = load i64, ptr %local.gi_d
  ret i64 %t540
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t541 = phi i64 [ 0, %else23_end ]
  %t542 = load i64, ptr %local.alpha
  %t543 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.68)
  %t544 = load i64, ptr %local.cos_val.519
  %t545 = call i64 @"sx_f64_sub"(i64 %t543, i64 %t544)
  %t546 = call i64 @"sx_f64_mul"(i64 %t542, i64 %t545)
  store i64 %t546, ptr %local.scale.520
  %t547 = load i64, ptr %local.gj0
  %t548 = load i64, ptr %local.gj1
  %t549 = load i64, ptr %local.gj2
  %t550 = load i64, ptr %local.gj3
  %t551 = load i64, ptr %local.gj4
  %t552 = load i64, ptr %local.gj5
  %t553 = load i64, ptr %local.gj0
  %t554 = load i64, ptr %local.gj1
  %t555 = load i64, ptr %local.gj2
  %t556 = load i64, ptr %local.gj3
  %t557 = load i64, ptr %local.gj4
  %t558 = load i64, ptr %local.gj5
  %t559 = call i64 @"dot6"(i64 %t547, i64 %t548, i64 %t549, i64 %t550, i64 %t551, i64 %t552, i64 %t553, i64 %t554, i64 %t555, i64 %t556, i64 %t557, i64 %t558)
  %t560 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.69)
  %t561 = call i64 @"sx_f64_add"(i64 %t559, i64 %t560)
  store i64 %t561, ptr %local.gj_sq.521
  %t562 = load i64, ptr %local.scale.520
  %t563 = load i64, ptr %local.gi0
  %t564 = load i64, ptr %local.gi1
  %t565 = load i64, ptr %local.gi2
  %t566 = load i64, ptr %local.gi3
  %t567 = load i64, ptr %local.gi4
  %t568 = load i64, ptr %local.gi5
  %t569 = load i64, ptr %local.gj0
  %t570 = load i64, ptr %local.gj1
  %t571 = load i64, ptr %local.gj2
  %t572 = load i64, ptr %local.gj3
  %t573 = load i64, ptr %local.gj4
  %t574 = load i64, ptr %local.gj5
  %t575 = call i64 @"dot6"(i64 %t563, i64 %t564, i64 %t565, i64 %t566, i64 %t567, i64 %t568, i64 %t569, i64 %t570, i64 %t571, i64 %t572, i64 %t573, i64 %t574)
  %t576 = call i64 @"sx_f64_mul"(i64 %t562, i64 %t575)
  %t577 = load i64, ptr %local.gj_sq.521
  %t578 = call i64 @"sx_f64_div"(i64 %t576, i64 %t577)
  store i64 %t578, ptr %local.proj_coeff.522
  %t579 = load i64, ptr %local.gi_d
  %t580 = load i64, ptr %local.proj_coeff.522
  %t581 = load i64, ptr %local.gj_d
  %t582 = call i64 @"sx_f64_mul"(i64 %t580, i64 %t581)
  %t583 = call i64 @"sx_f64_sub"(i64 %t579, i64 %t582)
  ret i64 %t583
}

define i64 @"pass_grad"(i64 %pass, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %dim) nounwind {
entry:
  %local.pass = alloca i64
  store i64 %pass, ptr %local.pass
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t584 = load i64, ptr %local.pass
  %t585 = icmp eq i64 %t584, 0
  %t586 = zext i1 %t585 to i64
  %t587 = icmp ne i64 %t586, 0
  br i1 %t587, label %then24, label %else24
then24:
  %t588 = load i64, ptr %local.w0
  %t589 = load i64, ptr %local.w1
  %t590 = load i64, ptr %local.w2
  %t591 = load i64, ptr %local.w3
  %t592 = load i64, ptr %local.w4
  %t593 = load i64, ptr %local.w5
  %t594 = load i64, ptr %local.dim
  %t595 = call i64 @"grad_inline"(i64 %t588, i64 %t589, i64 %t590, i64 %t591, i64 %t592, i64 %t593, i64 %t594)
  ret i64 %t595
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t596 = phi i64 [ 0, %else24_end ]
  %t597 = load i64, ptr %local.pass
  %t598 = icmp eq i64 %t597, 1
  %t599 = zext i1 %t598 to i64
  %t600 = icmp ne i64 %t599, 0
  br i1 %t600, label %then25, label %else25
then25:
  %t601 = load i64, ptr %local.w0
  %t602 = load i64, ptr %local.w1
  %t603 = load i64, ptr %local.w2
  %t604 = load i64, ptr %local.w3
  %t605 = load i64, ptr %local.w4
  %t606 = load i64, ptr %local.w5
  %t607 = load i64, ptr %local.dim
  %t608 = call i64 @"grad_unroll"(i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 %t606, i64 %t607)
  ret i64 %t608
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t609 = phi i64 [ 0, %else25_end ]
  %t610 = load i64, ptr %local.pass
  %t611 = icmp eq i64 %t610, 2
  %t612 = zext i1 %t611 to i64
  %t613 = icmp ne i64 %t612, 0
  br i1 %t613, label %then26, label %else26
then26:
  %t614 = load i64, ptr %local.w0
  %t615 = load i64, ptr %local.w1
  %t616 = load i64, ptr %local.w2
  %t617 = load i64, ptr %local.w3
  %t618 = load i64, ptr %local.w4
  %t619 = load i64, ptr %local.w5
  %t620 = load i64, ptr %local.dim
  %t621 = call i64 @"grad_constfold"(i64 %t614, i64 %t615, i64 %t616, i64 %t617, i64 %t618, i64 %t619, i64 %t620)
  ret i64 %t621
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t622 = phi i64 [ 0, %else26_end ]
  %t623 = load i64, ptr %local.w0
  %t624 = load i64, ptr %local.w1
  %t625 = load i64, ptr %local.w2
  %t626 = load i64, ptr %local.w3
  %t627 = load i64, ptr %local.w4
  %t628 = load i64, ptr %local.w5
  %t629 = load i64, ptr %local.dim
  %t630 = call i64 @"grad_simd"(i64 %t623, i64 %t624, i64 %t625, i64 %t626, i64 %t627, i64 %t628, i64 %t629)
  ret i64 %t630
}

define i64 @"pass_g0"(i64 %p, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.p = alloca i64
  store i64 %p, ptr %local.p
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t631 = load i64, ptr %local.p
  %t632 = load i64, ptr %local.w0
  %t633 = load i64, ptr %local.w1
  %t634 = load i64, ptr %local.w2
  %t635 = load i64, ptr %local.w3
  %t636 = load i64, ptr %local.w4
  %t637 = load i64, ptr %local.w5
  %t638 = call i64 @"pass_grad"(i64 %t631, i64 %t632, i64 %t633, i64 %t634, i64 %t635, i64 %t636, i64 %t637, i64 0)
  ret i64 %t638
}

define i64 @"pass_g1"(i64 %p, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.p = alloca i64
  store i64 %p, ptr %local.p
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t639 = load i64, ptr %local.p
  %t640 = load i64, ptr %local.w0
  %t641 = load i64, ptr %local.w1
  %t642 = load i64, ptr %local.w2
  %t643 = load i64, ptr %local.w3
  %t644 = load i64, ptr %local.w4
  %t645 = load i64, ptr %local.w5
  %t646 = call i64 @"pass_grad"(i64 %t639, i64 %t640, i64 %t641, i64 %t642, i64 %t643, i64 %t644, i64 %t645, i64 1)
  ret i64 %t646
}

define i64 @"pass_g2"(i64 %p, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.p = alloca i64
  store i64 %p, ptr %local.p
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t647 = load i64, ptr %local.p
  %t648 = load i64, ptr %local.w0
  %t649 = load i64, ptr %local.w1
  %t650 = load i64, ptr %local.w2
  %t651 = load i64, ptr %local.w3
  %t652 = load i64, ptr %local.w4
  %t653 = load i64, ptr %local.w5
  %t654 = call i64 @"pass_grad"(i64 %t647, i64 %t648, i64 %t649, i64 %t650, i64 %t651, i64 %t652, i64 %t653, i64 2)
  ret i64 %t654
}

define i64 @"pass_g3"(i64 %p, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.p = alloca i64
  store i64 %p, ptr %local.p
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t655 = load i64, ptr %local.p
  %t656 = load i64, ptr %local.w0
  %t657 = load i64, ptr %local.w1
  %t658 = load i64, ptr %local.w2
  %t659 = load i64, ptr %local.w3
  %t660 = load i64, ptr %local.w4
  %t661 = load i64, ptr %local.w5
  %t662 = call i64 @"pass_grad"(i64 %t655, i64 %t656, i64 %t657, i64 %t658, i64 %t659, i64 %t660, i64 %t661, i64 3)
  ret i64 %t662
}

define i64 @"pass_g4"(i64 %p, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.p = alloca i64
  store i64 %p, ptr %local.p
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t663 = load i64, ptr %local.p
  %t664 = load i64, ptr %local.w0
  %t665 = load i64, ptr %local.w1
  %t666 = load i64, ptr %local.w2
  %t667 = load i64, ptr %local.w3
  %t668 = load i64, ptr %local.w4
  %t669 = load i64, ptr %local.w5
  %t670 = call i64 @"pass_grad"(i64 %t663, i64 %t664, i64 %t665, i64 %t666, i64 %t667, i64 %t668, i64 %t669, i64 4)
  ret i64 %t670
}

define i64 @"pass_g5"(i64 %p, i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5) nounwind {
entry:
  %local.p = alloca i64
  store i64 %p, ptr %local.p
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %t671 = load i64, ptr %local.p
  %t672 = load i64, ptr %local.w0
  %t673 = load i64, ptr %local.w1
  %t674 = load i64, ptr %local.w2
  %t675 = load i64, ptr %local.w3
  %t676 = load i64, ptr %local.w4
  %t677 = load i64, ptr %local.w5
  %t678 = call i64 @"pass_grad"(i64 %t671, i64 %t672, i64 %t673, i64 %t674, i64 %t675, i64 %t676, i64 %t677, i64 5)
  ret i64 %t678
}

define i64 @"project_pass_dim"(i64 %w0, i64 %w1, i64 %w2, i64 %w3, i64 %w4, i64 %w5, i64 %pi, i64 %pj, i64 %dim, i64 %alpha) nounwind {
entry:
  %local.gi_d.679 = alloca i64
  %local.gi0.680 = alloca i64
  %local.gi1.681 = alloca i64
  %local.gi2.682 = alloca i64
  %local.gi3.683 = alloca i64
  %local.gi4.684 = alloca i64
  %local.gi5.685 = alloca i64
  %local.gj0.686 = alloca i64
  %local.gj1.687 = alloca i64
  %local.gj2.688 = alloca i64
  %local.gj3.689 = alloca i64
  %local.gj4.690 = alloca i64
  %local.gj5.691 = alloca i64
  %local.gj_d.692 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %local.w4 = alloca i64
  store i64 %w4, ptr %local.w4
  %local.w5 = alloca i64
  store i64 %w5, ptr %local.w5
  %local.pi = alloca i64
  store i64 %pi, ptr %local.pi
  %local.pj = alloca i64
  store i64 %pj, ptr %local.pj
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %t693 = load i64, ptr %local.pi
  %t694 = load i64, ptr %local.w0
  %t695 = load i64, ptr %local.w1
  %t696 = load i64, ptr %local.w2
  %t697 = load i64, ptr %local.w3
  %t698 = load i64, ptr %local.w4
  %t699 = load i64, ptr %local.w5
  %t700 = load i64, ptr %local.dim
  %t701 = call i64 @"pass_grad"(i64 %t693, i64 %t694, i64 %t695, i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 %t700)
  store i64 %t701, ptr %local.gi_d.679
  %t702 = load i64, ptr %local.pi
  %t703 = load i64, ptr %local.w0
  %t704 = load i64, ptr %local.w1
  %t705 = load i64, ptr %local.w2
  %t706 = load i64, ptr %local.w3
  %t707 = load i64, ptr %local.w4
  %t708 = load i64, ptr %local.w5
  %t709 = call i64 @"pass_g0"(i64 %t702, i64 %t703, i64 %t704, i64 %t705, i64 %t706, i64 %t707, i64 %t708)
  store i64 %t709, ptr %local.gi0.680
  %t710 = load i64, ptr %local.pi
  %t711 = load i64, ptr %local.w0
  %t712 = load i64, ptr %local.w1
  %t713 = load i64, ptr %local.w2
  %t714 = load i64, ptr %local.w3
  %t715 = load i64, ptr %local.w4
  %t716 = load i64, ptr %local.w5
  %t717 = call i64 @"pass_g1"(i64 %t710, i64 %t711, i64 %t712, i64 %t713, i64 %t714, i64 %t715, i64 %t716)
  store i64 %t717, ptr %local.gi1.681
  %t718 = load i64, ptr %local.pi
  %t719 = load i64, ptr %local.w0
  %t720 = load i64, ptr %local.w1
  %t721 = load i64, ptr %local.w2
  %t722 = load i64, ptr %local.w3
  %t723 = load i64, ptr %local.w4
  %t724 = load i64, ptr %local.w5
  %t725 = call i64 @"pass_g2"(i64 %t718, i64 %t719, i64 %t720, i64 %t721, i64 %t722, i64 %t723, i64 %t724)
  store i64 %t725, ptr %local.gi2.682
  %t726 = load i64, ptr %local.pi
  %t727 = load i64, ptr %local.w0
  %t728 = load i64, ptr %local.w1
  %t729 = load i64, ptr %local.w2
  %t730 = load i64, ptr %local.w3
  %t731 = load i64, ptr %local.w4
  %t732 = load i64, ptr %local.w5
  %t733 = call i64 @"pass_g3"(i64 %t726, i64 %t727, i64 %t728, i64 %t729, i64 %t730, i64 %t731, i64 %t732)
  store i64 %t733, ptr %local.gi3.683
  %t734 = load i64, ptr %local.pi
  %t735 = load i64, ptr %local.w0
  %t736 = load i64, ptr %local.w1
  %t737 = load i64, ptr %local.w2
  %t738 = load i64, ptr %local.w3
  %t739 = load i64, ptr %local.w4
  %t740 = load i64, ptr %local.w5
  %t741 = call i64 @"pass_g4"(i64 %t734, i64 %t735, i64 %t736, i64 %t737, i64 %t738, i64 %t739, i64 %t740)
  store i64 %t741, ptr %local.gi4.684
  %t742 = load i64, ptr %local.pi
  %t743 = load i64, ptr %local.w0
  %t744 = load i64, ptr %local.w1
  %t745 = load i64, ptr %local.w2
  %t746 = load i64, ptr %local.w3
  %t747 = load i64, ptr %local.w4
  %t748 = load i64, ptr %local.w5
  %t749 = call i64 @"pass_g5"(i64 %t742, i64 %t743, i64 %t744, i64 %t745, i64 %t746, i64 %t747, i64 %t748)
  store i64 %t749, ptr %local.gi5.685
  %t750 = load i64, ptr %local.pj
  %t751 = load i64, ptr %local.w0
  %t752 = load i64, ptr %local.w1
  %t753 = load i64, ptr %local.w2
  %t754 = load i64, ptr %local.w3
  %t755 = load i64, ptr %local.w4
  %t756 = load i64, ptr %local.w5
  %t757 = call i64 @"pass_g0"(i64 %t750, i64 %t751, i64 %t752, i64 %t753, i64 %t754, i64 %t755, i64 %t756)
  store i64 %t757, ptr %local.gj0.686
  %t758 = load i64, ptr %local.pj
  %t759 = load i64, ptr %local.w0
  %t760 = load i64, ptr %local.w1
  %t761 = load i64, ptr %local.w2
  %t762 = load i64, ptr %local.w3
  %t763 = load i64, ptr %local.w4
  %t764 = load i64, ptr %local.w5
  %t765 = call i64 @"pass_g1"(i64 %t758, i64 %t759, i64 %t760, i64 %t761, i64 %t762, i64 %t763, i64 %t764)
  store i64 %t765, ptr %local.gj1.687
  %t766 = load i64, ptr %local.pj
  %t767 = load i64, ptr %local.w0
  %t768 = load i64, ptr %local.w1
  %t769 = load i64, ptr %local.w2
  %t770 = load i64, ptr %local.w3
  %t771 = load i64, ptr %local.w4
  %t772 = load i64, ptr %local.w5
  %t773 = call i64 @"pass_g2"(i64 %t766, i64 %t767, i64 %t768, i64 %t769, i64 %t770, i64 %t771, i64 %t772)
  store i64 %t773, ptr %local.gj2.688
  %t774 = load i64, ptr %local.pj
  %t775 = load i64, ptr %local.w0
  %t776 = load i64, ptr %local.w1
  %t777 = load i64, ptr %local.w2
  %t778 = load i64, ptr %local.w3
  %t779 = load i64, ptr %local.w4
  %t780 = load i64, ptr %local.w5
  %t781 = call i64 @"pass_g3"(i64 %t774, i64 %t775, i64 %t776, i64 %t777, i64 %t778, i64 %t779, i64 %t780)
  store i64 %t781, ptr %local.gj3.689
  %t782 = load i64, ptr %local.pj
  %t783 = load i64, ptr %local.w0
  %t784 = load i64, ptr %local.w1
  %t785 = load i64, ptr %local.w2
  %t786 = load i64, ptr %local.w3
  %t787 = load i64, ptr %local.w4
  %t788 = load i64, ptr %local.w5
  %t789 = call i64 @"pass_g4"(i64 %t782, i64 %t783, i64 %t784, i64 %t785, i64 %t786, i64 %t787, i64 %t788)
  store i64 %t789, ptr %local.gj4.690
  %t790 = load i64, ptr %local.pj
  %t791 = load i64, ptr %local.w0
  %t792 = load i64, ptr %local.w1
  %t793 = load i64, ptr %local.w2
  %t794 = load i64, ptr %local.w3
  %t795 = load i64, ptr %local.w4
  %t796 = load i64, ptr %local.w5
  %t797 = call i64 @"pass_g5"(i64 %t790, i64 %t791, i64 %t792, i64 %t793, i64 %t794, i64 %t795, i64 %t796)
  store i64 %t797, ptr %local.gj5.691
  %t798 = load i64, ptr %local.pj
  %t799 = load i64, ptr %local.w0
  %t800 = load i64, ptr %local.w1
  %t801 = load i64, ptr %local.w2
  %t802 = load i64, ptr %local.w3
  %t803 = load i64, ptr %local.w4
  %t804 = load i64, ptr %local.w5
  %t805 = load i64, ptr %local.dim
  %t806 = call i64 @"pass_grad"(i64 %t798, i64 %t799, i64 %t800, i64 %t801, i64 %t802, i64 %t803, i64 %t804, i64 %t805)
  store i64 %t806, ptr %local.gj_d.692
  %t807 = load i64, ptr %local.gi_d.679
  %t808 = load i64, ptr %local.gi0.680
  %t809 = load i64, ptr %local.gi1.681
  %t810 = load i64, ptr %local.gi2.682
  %t811 = load i64, ptr %local.gi3.683
  %t812 = load i64, ptr %local.gi4.684
  %t813 = load i64, ptr %local.gi5.685
  %t814 = load i64, ptr %local.gj0.686
  %t815 = load i64, ptr %local.gj1.687
  %t816 = load i64, ptr %local.gj2.688
  %t817 = load i64, ptr %local.gj3.689
  %t818 = load i64, ptr %local.gj4.690
  %t819 = load i64, ptr %local.gj5.691
  %t820 = load i64, ptr %local.gj_d.692
  %t821 = load i64, ptr %local.alpha
  %t822 = call i64 @"project_1d"(i64 %t807, i64 %t808, i64 %t809, i64 %t810, i64 %t811, i64 %t812, i64 %t813, i64 %t814, i64 %t815, i64 %t816, i64 %t817, i64 %t818, i64 %t819, i64 %t820, i64 %t821)
  ret i64 %t822
}

define i64 @"run_inner"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %bias0, i64 %bias1, i64 %bias2, i64 %bias3, i64 %steps) nounwind {
entry:
  %local.w0.823 = alloca i64
  %local.w1.824 = alloca i64
  %local.w2.825 = alloca i64
  %local.w3.826 = alloca i64
  %local.w4.827 = alloca i64
  %local.w5.828 = alloca i64
  %local.step.829 = alloca i64
  %local.p0d.830 = alloca i64
  %local.p1d.831 = alloca i64
  %local.p2d.832 = alloca i64
  %local.p3d.833 = alloca i64
  %local.dim.834 = alloca i64
  %local.upd.835 = alloca i64
  %local.lr.836 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.bias0 = alloca i64
  store i64 %bias0, ptr %local.bias0
  %local.bias1 = alloca i64
  store i64 %bias1, ptr %local.bias1
  %local.bias2 = alloca i64
  store i64 %bias2, ptr %local.bias2
  %local.bias3 = alloca i64
  store i64 %bias3, ptr %local.bias3
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t837 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.70)
  store i64 %t837, ptr %local.w0.823
  %t838 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.71)
  store i64 %t838, ptr %local.w1.824
  %t839 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.72)
  store i64 %t839, ptr %local.w2.825
  %t840 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.73)
  store i64 %t840, ptr %local.w3.826
  %t841 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.74)
  store i64 %t841, ptr %local.w4.827
  %t842 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.75)
  store i64 %t842, ptr %local.w5.828
  store i64 0, ptr %local.step.829
  %t843 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.76)
  store i64 %t843, ptr %local.p0d.830
  %t844 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.77)
  store i64 %t844, ptr %local.p1d.831
  %t845 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.78)
  store i64 %t845, ptr %local.p2d.832
  %t846 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.79)
  store i64 %t846, ptr %local.p3d.833
  store i64 0, ptr %local.dim.834
  %t847 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.80)
  store i64 %t847, ptr %local.upd.835
  %t848 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.81)
  store i64 %t848, ptr %local.lr.836
  br label %loop27
loop27:
  %t849 = load i64, ptr %local.step.829
  %t850 = load i64, ptr %local.steps
  %t851 = icmp slt i64 %t849, %t850
  %t852 = zext i1 %t851 to i64
  %t853 = icmp ne i64 %t852, 0
  br i1 %t853, label %body27, label %endloop27
body27:
  store i64 0, ptr %local.dim.834
  br label %loop28
loop28:
  %t854 = load i64, ptr %local.dim.834
  %t855 = icmp slt i64 %t854, 6
  %t856 = zext i1 %t855 to i64
  %t857 = icmp ne i64 %t856, 0
  br i1 %t857, label %body28, label %endloop28
body28:
  %t858 = load i64, ptr %local.w0.823
  %t859 = load i64, ptr %local.w1.824
  %t860 = load i64, ptr %local.w2.825
  %t861 = load i64, ptr %local.w3.826
  %t862 = load i64, ptr %local.w4.827
  %t863 = load i64, ptr %local.w5.828
  %t864 = load i64, ptr %local.dim.834
  %t865 = load i64, ptr %local.a01
  %t866 = call i64 @"project_pass_dim"(i64 %t858, i64 %t859, i64 %t860, i64 %t861, i64 %t862, i64 %t863, i64 0, i64 1, i64 %t864, i64 %t865)
  store i64 %t866, ptr %local.p0d.830
  %t867 = load i64, ptr %local.w0.823
  %t868 = load i64, ptr %local.w1.824
  %t869 = load i64, ptr %local.w2.825
  %t870 = load i64, ptr %local.w3.826
  %t871 = load i64, ptr %local.w4.827
  %t872 = load i64, ptr %local.w5.828
  %t873 = load i64, ptr %local.dim.834
  %t874 = load i64, ptr %local.a02
  %t875 = call i64 @"project_pass_dim"(i64 %t867, i64 %t868, i64 %t869, i64 %t870, i64 %t871, i64 %t872, i64 0, i64 2, i64 %t873, i64 %t874)
  store i64 %t875, ptr %local.p0d.830
  %t876 = load i64, ptr %local.w0.823
  %t877 = load i64, ptr %local.w1.824
  %t878 = load i64, ptr %local.w2.825
  %t879 = load i64, ptr %local.w3.826
  %t880 = load i64, ptr %local.w4.827
  %t881 = load i64, ptr %local.w5.828
  %t882 = load i64, ptr %local.dim.834
  %t883 = load i64, ptr %local.a03
  %t884 = call i64 @"project_pass_dim"(i64 %t876, i64 %t877, i64 %t878, i64 %t879, i64 %t880, i64 %t881, i64 0, i64 3, i64 %t882, i64 %t883)
  store i64 %t884, ptr %local.p0d.830
  %t885 = load i64, ptr %local.w0.823
  %t886 = load i64, ptr %local.w1.824
  %t887 = load i64, ptr %local.w2.825
  %t888 = load i64, ptr %local.w3.826
  %t889 = load i64, ptr %local.w4.827
  %t890 = load i64, ptr %local.w5.828
  %t891 = load i64, ptr %local.dim.834
  %t892 = load i64, ptr %local.a10
  %t893 = call i64 @"project_pass_dim"(i64 %t885, i64 %t886, i64 %t887, i64 %t888, i64 %t889, i64 %t890, i64 1, i64 0, i64 %t891, i64 %t892)
  store i64 %t893, ptr %local.p1d.831
  %t894 = load i64, ptr %local.w0.823
  %t895 = load i64, ptr %local.w1.824
  %t896 = load i64, ptr %local.w2.825
  %t897 = load i64, ptr %local.w3.826
  %t898 = load i64, ptr %local.w4.827
  %t899 = load i64, ptr %local.w5.828
  %t900 = load i64, ptr %local.dim.834
  %t901 = load i64, ptr %local.a12
  %t902 = call i64 @"project_pass_dim"(i64 %t894, i64 %t895, i64 %t896, i64 %t897, i64 %t898, i64 %t899, i64 1, i64 2, i64 %t900, i64 %t901)
  store i64 %t902, ptr %local.p1d.831
  %t903 = load i64, ptr %local.w0.823
  %t904 = load i64, ptr %local.w1.824
  %t905 = load i64, ptr %local.w2.825
  %t906 = load i64, ptr %local.w3.826
  %t907 = load i64, ptr %local.w4.827
  %t908 = load i64, ptr %local.w5.828
  %t909 = load i64, ptr %local.dim.834
  %t910 = load i64, ptr %local.a13
  %t911 = call i64 @"project_pass_dim"(i64 %t903, i64 %t904, i64 %t905, i64 %t906, i64 %t907, i64 %t908, i64 1, i64 3, i64 %t909, i64 %t910)
  store i64 %t911, ptr %local.p1d.831
  %t912 = load i64, ptr %local.w0.823
  %t913 = load i64, ptr %local.w1.824
  %t914 = load i64, ptr %local.w2.825
  %t915 = load i64, ptr %local.w3.826
  %t916 = load i64, ptr %local.w4.827
  %t917 = load i64, ptr %local.w5.828
  %t918 = load i64, ptr %local.dim.834
  %t919 = load i64, ptr %local.a20
  %t920 = call i64 @"project_pass_dim"(i64 %t912, i64 %t913, i64 %t914, i64 %t915, i64 %t916, i64 %t917, i64 2, i64 0, i64 %t918, i64 %t919)
  store i64 %t920, ptr %local.p2d.832
  %t921 = load i64, ptr %local.w0.823
  %t922 = load i64, ptr %local.w1.824
  %t923 = load i64, ptr %local.w2.825
  %t924 = load i64, ptr %local.w3.826
  %t925 = load i64, ptr %local.w4.827
  %t926 = load i64, ptr %local.w5.828
  %t927 = load i64, ptr %local.dim.834
  %t928 = load i64, ptr %local.a21
  %t929 = call i64 @"project_pass_dim"(i64 %t921, i64 %t922, i64 %t923, i64 %t924, i64 %t925, i64 %t926, i64 2, i64 1, i64 %t927, i64 %t928)
  store i64 %t929, ptr %local.p2d.832
  %t930 = load i64, ptr %local.w0.823
  %t931 = load i64, ptr %local.w1.824
  %t932 = load i64, ptr %local.w2.825
  %t933 = load i64, ptr %local.w3.826
  %t934 = load i64, ptr %local.w4.827
  %t935 = load i64, ptr %local.w5.828
  %t936 = load i64, ptr %local.dim.834
  %t937 = load i64, ptr %local.a23
  %t938 = call i64 @"project_pass_dim"(i64 %t930, i64 %t931, i64 %t932, i64 %t933, i64 %t934, i64 %t935, i64 2, i64 3, i64 %t936, i64 %t937)
  store i64 %t938, ptr %local.p2d.832
  %t939 = load i64, ptr %local.w0.823
  %t940 = load i64, ptr %local.w1.824
  %t941 = load i64, ptr %local.w2.825
  %t942 = load i64, ptr %local.w3.826
  %t943 = load i64, ptr %local.w4.827
  %t944 = load i64, ptr %local.w5.828
  %t945 = load i64, ptr %local.dim.834
  %t946 = load i64, ptr %local.a30
  %t947 = call i64 @"project_pass_dim"(i64 %t939, i64 %t940, i64 %t941, i64 %t942, i64 %t943, i64 %t944, i64 3, i64 0, i64 %t945, i64 %t946)
  store i64 %t947, ptr %local.p3d.833
  %t948 = load i64, ptr %local.w0.823
  %t949 = load i64, ptr %local.w1.824
  %t950 = load i64, ptr %local.w2.825
  %t951 = load i64, ptr %local.w3.826
  %t952 = load i64, ptr %local.w4.827
  %t953 = load i64, ptr %local.w5.828
  %t954 = load i64, ptr %local.dim.834
  %t955 = load i64, ptr %local.a31
  %t956 = call i64 @"project_pass_dim"(i64 %t948, i64 %t949, i64 %t950, i64 %t951, i64 %t952, i64 %t953, i64 3, i64 1, i64 %t954, i64 %t955)
  store i64 %t956, ptr %local.p3d.833
  %t957 = load i64, ptr %local.w0.823
  %t958 = load i64, ptr %local.w1.824
  %t959 = load i64, ptr %local.w2.825
  %t960 = load i64, ptr %local.w3.826
  %t961 = load i64, ptr %local.w4.827
  %t962 = load i64, ptr %local.w5.828
  %t963 = load i64, ptr %local.dim.834
  %t964 = load i64, ptr %local.a32
  %t965 = call i64 @"project_pass_dim"(i64 %t957, i64 %t958, i64 %t959, i64 %t960, i64 %t961, i64 %t962, i64 3, i64 2, i64 %t963, i64 %t964)
  store i64 %t965, ptr %local.p3d.833
  %t966 = load i64, ptr %local.bias0
  %t967 = load i64, ptr %local.p0d.830
  %t968 = call i64 @"sx_f64_mul"(i64 %t966, i64 %t967)
  %t969 = load i64, ptr %local.bias1
  %t970 = load i64, ptr %local.p1d.831
  %t971 = call i64 @"sx_f64_mul"(i64 %t969, i64 %t970)
  %t972 = call i64 @"sx_f64_add"(i64 %t968, i64 %t971)
  %t973 = load i64, ptr %local.bias2
  %t974 = load i64, ptr %local.p2d.832
  %t975 = call i64 @"sx_f64_mul"(i64 %t973, i64 %t974)
  %t976 = call i64 @"sx_f64_add"(i64 %t972, i64 %t975)
  %t977 = load i64, ptr %local.bias3
  %t978 = load i64, ptr %local.p3d.833
  %t979 = call i64 @"sx_f64_mul"(i64 %t977, i64 %t978)
  %t980 = call i64 @"sx_f64_add"(i64 %t976, i64 %t979)
  store i64 %t980, ptr %local.upd.835
  %t981 = load i64, ptr %local.dim.834
  %t982 = icmp eq i64 %t981, 0
  %t983 = zext i1 %t982 to i64
  %t984 = icmp ne i64 %t983, 0
  br i1 %t984, label %then29, label %else29
then29:
  %t985 = load i64, ptr %local.w0.823
  %t986 = load i64, ptr %local.lr.836
  %t987 = load i64, ptr %local.upd.835
  %t988 = call i64 @"sx_f64_mul"(i64 %t986, i64 %t987)
  %t989 = call i64 @"sx_f64_sub"(i64 %t985, i64 %t988)
  store i64 %t989, ptr %local.w0.823
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t990 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t991 = load i64, ptr %local.dim.834
  %t992 = icmp eq i64 %t991, 1
  %t993 = zext i1 %t992 to i64
  %t994 = icmp ne i64 %t993, 0
  br i1 %t994, label %then30, label %else30
then30:
  %t995 = load i64, ptr %local.w1.824
  %t996 = load i64, ptr %local.lr.836
  %t997 = load i64, ptr %local.upd.835
  %t998 = call i64 @"sx_f64_mul"(i64 %t996, i64 %t997)
  %t999 = call i64 @"sx_f64_sub"(i64 %t995, i64 %t998)
  store i64 %t999, ptr %local.w1.824
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1000 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1001 = load i64, ptr %local.dim.834
  %t1002 = icmp eq i64 %t1001, 2
  %t1003 = zext i1 %t1002 to i64
  %t1004 = icmp ne i64 %t1003, 0
  br i1 %t1004, label %then31, label %else31
then31:
  %t1005 = load i64, ptr %local.w2.825
  %t1006 = load i64, ptr %local.lr.836
  %t1007 = load i64, ptr %local.upd.835
  %t1008 = call i64 @"sx_f64_mul"(i64 %t1006, i64 %t1007)
  %t1009 = call i64 @"sx_f64_sub"(i64 %t1005, i64 %t1008)
  store i64 %t1009, ptr %local.w2.825
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1010 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1011 = load i64, ptr %local.dim.834
  %t1012 = icmp eq i64 %t1011, 3
  %t1013 = zext i1 %t1012 to i64
  %t1014 = icmp ne i64 %t1013, 0
  br i1 %t1014, label %then32, label %else32
then32:
  %t1015 = load i64, ptr %local.w3.826
  %t1016 = load i64, ptr %local.lr.836
  %t1017 = load i64, ptr %local.upd.835
  %t1018 = call i64 @"sx_f64_mul"(i64 %t1016, i64 %t1017)
  %t1019 = call i64 @"sx_f64_sub"(i64 %t1015, i64 %t1018)
  store i64 %t1019, ptr %local.w3.826
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1020 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1021 = load i64, ptr %local.dim.834
  %t1022 = icmp eq i64 %t1021, 4
  %t1023 = zext i1 %t1022 to i64
  %t1024 = icmp ne i64 %t1023, 0
  br i1 %t1024, label %then33, label %else33
then33:
  %t1025 = load i64, ptr %local.w4.827
  %t1026 = load i64, ptr %local.lr.836
  %t1027 = load i64, ptr %local.upd.835
  %t1028 = call i64 @"sx_f64_mul"(i64 %t1026, i64 %t1027)
  %t1029 = call i64 @"sx_f64_sub"(i64 %t1025, i64 %t1028)
  store i64 %t1029, ptr %local.w4.827
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1030 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1031 = load i64, ptr %local.dim.834
  %t1032 = icmp eq i64 %t1031, 5
  %t1033 = zext i1 %t1032 to i64
  %t1034 = icmp ne i64 %t1033, 0
  br i1 %t1034, label %then34, label %else34
then34:
  %t1035 = load i64, ptr %local.w5.828
  %t1036 = load i64, ptr %local.lr.836
  %t1037 = load i64, ptr %local.upd.835
  %t1038 = call i64 @"sx_f64_mul"(i64 %t1036, i64 %t1037)
  %t1039 = call i64 @"sx_f64_sub"(i64 %t1035, i64 %t1038)
  store i64 %t1039, ptr %local.w5.828
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1040 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1041 = load i64, ptr %local.dim.834
  %t1042 = add i64 %t1041, 1
  store i64 %t1042, ptr %local.dim.834
  br label %loop28
endloop28:
  %t1043 = load i64, ptr %local.step.829
  %t1044 = add i64 %t1043, 1
  store i64 %t1044, ptr %local.step.829
  br label %loop27
endloop27:
  %t1045 = load i64, ptr %local.bias0
  %t1046 = load i64, ptr %local.w0.823
  %t1047 = load i64, ptr %local.w1.824
  %t1048 = load i64, ptr %local.w2.825
  %t1049 = load i64, ptr %local.w3.826
  %t1050 = load i64, ptr %local.w4.827
  %t1051 = load i64, ptr %local.w5.828
  %t1052 = call i64 @"loss_inline"(i64 %t1046, i64 %t1047, i64 %t1048, i64 %t1049, i64 %t1050, i64 %t1051)
  %t1053 = call i64 @"sx_f64_mul"(i64 %t1045, i64 %t1052)
  %t1054 = load i64, ptr %local.bias1
  %t1055 = load i64, ptr %local.w0.823
  %t1056 = load i64, ptr %local.w1.824
  %t1057 = load i64, ptr %local.w2.825
  %t1058 = load i64, ptr %local.w3.826
  %t1059 = load i64, ptr %local.w4.827
  %t1060 = load i64, ptr %local.w5.828
  %t1061 = call i64 @"loss_unroll"(i64 %t1055, i64 %t1056, i64 %t1057, i64 %t1058, i64 %t1059, i64 %t1060)
  %t1062 = call i64 @"sx_f64_mul"(i64 %t1054, i64 %t1061)
  %t1063 = call i64 @"sx_f64_add"(i64 %t1053, i64 %t1062)
  %t1064 = load i64, ptr %local.bias2
  %t1065 = load i64, ptr %local.w0.823
  %t1066 = load i64, ptr %local.w1.824
  %t1067 = load i64, ptr %local.w2.825
  %t1068 = load i64, ptr %local.w3.826
  %t1069 = load i64, ptr %local.w4.827
  %t1070 = load i64, ptr %local.w5.828
  %t1071 = call i64 @"loss_constfold"(i64 %t1065, i64 %t1066, i64 %t1067, i64 %t1068, i64 %t1069, i64 %t1070)
  %t1072 = call i64 @"sx_f64_mul"(i64 %t1064, i64 %t1071)
  %t1073 = call i64 @"sx_f64_add"(i64 %t1063, i64 %t1072)
  %t1074 = load i64, ptr %local.bias3
  %t1075 = load i64, ptr %local.w0.823
  %t1076 = load i64, ptr %local.w1.824
  %t1077 = load i64, ptr %local.w2.825
  %t1078 = load i64, ptr %local.w3.826
  %t1079 = load i64, ptr %local.w4.827
  %t1080 = load i64, ptr %local.w5.828
  %t1081 = call i64 @"loss_simd"(i64 %t1075, i64 %t1076, i64 %t1077, i64 %t1078, i64 %t1079, i64 %t1080)
  %t1082 = call i64 @"sx_f64_mul"(i64 %t1074, i64 %t1081)
  %t1083 = call i64 @"sx_f64_add"(i64 %t1073, i64 %t1082)
  ret i64 %t1083
}

define i64 @"run_inner_pass_loss"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %which_pass, i64 %steps) nounwind {
entry:
  %local.w0.1084 = alloca i64
  %local.w1.1085 = alloca i64
  %local.w2.1086 = alloca i64
  %local.w3.1087 = alloca i64
  %local.w4.1088 = alloca i64
  %local.w5.1089 = alloca i64
  %local.step.1090 = alloca i64
  %local.dim.1091 = alloca i64
  %local.p0d.1092 = alloca i64
  %local.p1d.1093 = alloca i64
  %local.p2d.1094 = alloca i64
  %local.p3d.1095 = alloca i64
  %local.upd.1096 = alloca i64
  %local.lr.1097 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.which_pass = alloca i64
  store i64 %which_pass, ptr %local.which_pass
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1098 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.82)
  store i64 %t1098, ptr %local.w0.1084
  %t1099 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.83)
  store i64 %t1099, ptr %local.w1.1085
  %t1100 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.84)
  store i64 %t1100, ptr %local.w2.1086
  %t1101 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.85)
  store i64 %t1101, ptr %local.w3.1087
  %t1102 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.86)
  store i64 %t1102, ptr %local.w4.1088
  %t1103 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.87)
  store i64 %t1103, ptr %local.w5.1089
  store i64 0, ptr %local.step.1090
  store i64 0, ptr %local.dim.1091
  %t1104 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.88)
  store i64 %t1104, ptr %local.p0d.1092
  %t1105 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.89)
  store i64 %t1105, ptr %local.p1d.1093
  %t1106 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.90)
  store i64 %t1106, ptr %local.p2d.1094
  %t1107 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.91)
  store i64 %t1107, ptr %local.p3d.1095
  %t1108 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.92)
  store i64 %t1108, ptr %local.upd.1096
  %t1109 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.93)
  store i64 %t1109, ptr %local.lr.1097
  br label %loop35
loop35:
  %t1110 = load i64, ptr %local.step.1090
  %t1111 = load i64, ptr %local.steps
  %t1112 = icmp slt i64 %t1110, %t1111
  %t1113 = zext i1 %t1112 to i64
  %t1114 = icmp ne i64 %t1113, 0
  br i1 %t1114, label %body35, label %endloop35
body35:
  store i64 0, ptr %local.dim.1091
  br label %loop36
loop36:
  %t1115 = load i64, ptr %local.dim.1091
  %t1116 = icmp slt i64 %t1115, 6
  %t1117 = zext i1 %t1116 to i64
  %t1118 = icmp ne i64 %t1117, 0
  br i1 %t1118, label %body36, label %endloop36
body36:
  %t1119 = load i64, ptr %local.w0.1084
  %t1120 = load i64, ptr %local.w1.1085
  %t1121 = load i64, ptr %local.w2.1086
  %t1122 = load i64, ptr %local.w3.1087
  %t1123 = load i64, ptr %local.w4.1088
  %t1124 = load i64, ptr %local.w5.1089
  %t1125 = load i64, ptr %local.dim.1091
  %t1126 = load i64, ptr %local.a01
  %t1127 = call i64 @"project_pass_dim"(i64 %t1119, i64 %t1120, i64 %t1121, i64 %t1122, i64 %t1123, i64 %t1124, i64 0, i64 1, i64 %t1125, i64 %t1126)
  store i64 %t1127, ptr %local.p0d.1092
  %t1128 = load i64, ptr %local.w0.1084
  %t1129 = load i64, ptr %local.w1.1085
  %t1130 = load i64, ptr %local.w2.1086
  %t1131 = load i64, ptr %local.w3.1087
  %t1132 = load i64, ptr %local.w4.1088
  %t1133 = load i64, ptr %local.w5.1089
  %t1134 = load i64, ptr %local.dim.1091
  %t1135 = load i64, ptr %local.a02
  %t1136 = call i64 @"project_pass_dim"(i64 %t1128, i64 %t1129, i64 %t1130, i64 %t1131, i64 %t1132, i64 %t1133, i64 0, i64 2, i64 %t1134, i64 %t1135)
  store i64 %t1136, ptr %local.p0d.1092
  %t1137 = load i64, ptr %local.w0.1084
  %t1138 = load i64, ptr %local.w1.1085
  %t1139 = load i64, ptr %local.w2.1086
  %t1140 = load i64, ptr %local.w3.1087
  %t1141 = load i64, ptr %local.w4.1088
  %t1142 = load i64, ptr %local.w5.1089
  %t1143 = load i64, ptr %local.dim.1091
  %t1144 = load i64, ptr %local.a03
  %t1145 = call i64 @"project_pass_dim"(i64 %t1137, i64 %t1138, i64 %t1139, i64 %t1140, i64 %t1141, i64 %t1142, i64 0, i64 3, i64 %t1143, i64 %t1144)
  store i64 %t1145, ptr %local.p0d.1092
  %t1146 = load i64, ptr %local.w0.1084
  %t1147 = load i64, ptr %local.w1.1085
  %t1148 = load i64, ptr %local.w2.1086
  %t1149 = load i64, ptr %local.w3.1087
  %t1150 = load i64, ptr %local.w4.1088
  %t1151 = load i64, ptr %local.w5.1089
  %t1152 = load i64, ptr %local.dim.1091
  %t1153 = load i64, ptr %local.a10
  %t1154 = call i64 @"project_pass_dim"(i64 %t1146, i64 %t1147, i64 %t1148, i64 %t1149, i64 %t1150, i64 %t1151, i64 1, i64 0, i64 %t1152, i64 %t1153)
  store i64 %t1154, ptr %local.p1d.1093
  %t1155 = load i64, ptr %local.w0.1084
  %t1156 = load i64, ptr %local.w1.1085
  %t1157 = load i64, ptr %local.w2.1086
  %t1158 = load i64, ptr %local.w3.1087
  %t1159 = load i64, ptr %local.w4.1088
  %t1160 = load i64, ptr %local.w5.1089
  %t1161 = load i64, ptr %local.dim.1091
  %t1162 = load i64, ptr %local.a12
  %t1163 = call i64 @"project_pass_dim"(i64 %t1155, i64 %t1156, i64 %t1157, i64 %t1158, i64 %t1159, i64 %t1160, i64 1, i64 2, i64 %t1161, i64 %t1162)
  store i64 %t1163, ptr %local.p1d.1093
  %t1164 = load i64, ptr %local.w0.1084
  %t1165 = load i64, ptr %local.w1.1085
  %t1166 = load i64, ptr %local.w2.1086
  %t1167 = load i64, ptr %local.w3.1087
  %t1168 = load i64, ptr %local.w4.1088
  %t1169 = load i64, ptr %local.w5.1089
  %t1170 = load i64, ptr %local.dim.1091
  %t1171 = load i64, ptr %local.a13
  %t1172 = call i64 @"project_pass_dim"(i64 %t1164, i64 %t1165, i64 %t1166, i64 %t1167, i64 %t1168, i64 %t1169, i64 1, i64 3, i64 %t1170, i64 %t1171)
  store i64 %t1172, ptr %local.p1d.1093
  %t1173 = load i64, ptr %local.w0.1084
  %t1174 = load i64, ptr %local.w1.1085
  %t1175 = load i64, ptr %local.w2.1086
  %t1176 = load i64, ptr %local.w3.1087
  %t1177 = load i64, ptr %local.w4.1088
  %t1178 = load i64, ptr %local.w5.1089
  %t1179 = load i64, ptr %local.dim.1091
  %t1180 = load i64, ptr %local.a20
  %t1181 = call i64 @"project_pass_dim"(i64 %t1173, i64 %t1174, i64 %t1175, i64 %t1176, i64 %t1177, i64 %t1178, i64 2, i64 0, i64 %t1179, i64 %t1180)
  store i64 %t1181, ptr %local.p2d.1094
  %t1182 = load i64, ptr %local.w0.1084
  %t1183 = load i64, ptr %local.w1.1085
  %t1184 = load i64, ptr %local.w2.1086
  %t1185 = load i64, ptr %local.w3.1087
  %t1186 = load i64, ptr %local.w4.1088
  %t1187 = load i64, ptr %local.w5.1089
  %t1188 = load i64, ptr %local.dim.1091
  %t1189 = load i64, ptr %local.a21
  %t1190 = call i64 @"project_pass_dim"(i64 %t1182, i64 %t1183, i64 %t1184, i64 %t1185, i64 %t1186, i64 %t1187, i64 2, i64 1, i64 %t1188, i64 %t1189)
  store i64 %t1190, ptr %local.p2d.1094
  %t1191 = load i64, ptr %local.w0.1084
  %t1192 = load i64, ptr %local.w1.1085
  %t1193 = load i64, ptr %local.w2.1086
  %t1194 = load i64, ptr %local.w3.1087
  %t1195 = load i64, ptr %local.w4.1088
  %t1196 = load i64, ptr %local.w5.1089
  %t1197 = load i64, ptr %local.dim.1091
  %t1198 = load i64, ptr %local.a23
  %t1199 = call i64 @"project_pass_dim"(i64 %t1191, i64 %t1192, i64 %t1193, i64 %t1194, i64 %t1195, i64 %t1196, i64 2, i64 3, i64 %t1197, i64 %t1198)
  store i64 %t1199, ptr %local.p2d.1094
  %t1200 = load i64, ptr %local.w0.1084
  %t1201 = load i64, ptr %local.w1.1085
  %t1202 = load i64, ptr %local.w2.1086
  %t1203 = load i64, ptr %local.w3.1087
  %t1204 = load i64, ptr %local.w4.1088
  %t1205 = load i64, ptr %local.w5.1089
  %t1206 = load i64, ptr %local.dim.1091
  %t1207 = load i64, ptr %local.a30
  %t1208 = call i64 @"project_pass_dim"(i64 %t1200, i64 %t1201, i64 %t1202, i64 %t1203, i64 %t1204, i64 %t1205, i64 3, i64 0, i64 %t1206, i64 %t1207)
  store i64 %t1208, ptr %local.p3d.1095
  %t1209 = load i64, ptr %local.w0.1084
  %t1210 = load i64, ptr %local.w1.1085
  %t1211 = load i64, ptr %local.w2.1086
  %t1212 = load i64, ptr %local.w3.1087
  %t1213 = load i64, ptr %local.w4.1088
  %t1214 = load i64, ptr %local.w5.1089
  %t1215 = load i64, ptr %local.dim.1091
  %t1216 = load i64, ptr %local.a31
  %t1217 = call i64 @"project_pass_dim"(i64 %t1209, i64 %t1210, i64 %t1211, i64 %t1212, i64 %t1213, i64 %t1214, i64 3, i64 1, i64 %t1215, i64 %t1216)
  store i64 %t1217, ptr %local.p3d.1095
  %t1218 = load i64, ptr %local.w0.1084
  %t1219 = load i64, ptr %local.w1.1085
  %t1220 = load i64, ptr %local.w2.1086
  %t1221 = load i64, ptr %local.w3.1087
  %t1222 = load i64, ptr %local.w4.1088
  %t1223 = load i64, ptr %local.w5.1089
  %t1224 = load i64, ptr %local.dim.1091
  %t1225 = load i64, ptr %local.a32
  %t1226 = call i64 @"project_pass_dim"(i64 %t1218, i64 %t1219, i64 %t1220, i64 %t1221, i64 %t1222, i64 %t1223, i64 3, i64 2, i64 %t1224, i64 %t1225)
  store i64 %t1226, ptr %local.p3d.1095
  %t1227 = load i64, ptr %local.p0d.1092
  %t1228 = load i64, ptr %local.p1d.1093
  %t1229 = call i64 @"sx_f64_add"(i64 %t1227, i64 %t1228)
  %t1230 = load i64, ptr %local.p2d.1094
  %t1231 = call i64 @"sx_f64_add"(i64 %t1229, i64 %t1230)
  %t1232 = load i64, ptr %local.p3d.1095
  %t1233 = call i64 @"sx_f64_add"(i64 %t1231, i64 %t1232)
  store i64 %t1233, ptr %local.upd.1096
  %t1234 = load i64, ptr %local.dim.1091
  %t1235 = icmp eq i64 %t1234, 0
  %t1236 = zext i1 %t1235 to i64
  %t1237 = icmp ne i64 %t1236, 0
  br i1 %t1237, label %then37, label %else37
then37:
  %t1238 = load i64, ptr %local.w0.1084
  %t1239 = load i64, ptr %local.lr.1097
  %t1240 = load i64, ptr %local.upd.1096
  %t1241 = call i64 @"sx_f64_mul"(i64 %t1239, i64 %t1240)
  %t1242 = call i64 @"sx_f64_sub"(i64 %t1238, i64 %t1241)
  store i64 %t1242, ptr %local.w0.1084
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1243 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t1244 = load i64, ptr %local.dim.1091
  %t1245 = icmp eq i64 %t1244, 1
  %t1246 = zext i1 %t1245 to i64
  %t1247 = icmp ne i64 %t1246, 0
  br i1 %t1247, label %then38, label %else38
then38:
  %t1248 = load i64, ptr %local.w1.1085
  %t1249 = load i64, ptr %local.lr.1097
  %t1250 = load i64, ptr %local.upd.1096
  %t1251 = call i64 @"sx_f64_mul"(i64 %t1249, i64 %t1250)
  %t1252 = call i64 @"sx_f64_sub"(i64 %t1248, i64 %t1251)
  store i64 %t1252, ptr %local.w1.1085
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1253 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1254 = load i64, ptr %local.dim.1091
  %t1255 = icmp eq i64 %t1254, 2
  %t1256 = zext i1 %t1255 to i64
  %t1257 = icmp ne i64 %t1256, 0
  br i1 %t1257, label %then39, label %else39
then39:
  %t1258 = load i64, ptr %local.w2.1086
  %t1259 = load i64, ptr %local.lr.1097
  %t1260 = load i64, ptr %local.upd.1096
  %t1261 = call i64 @"sx_f64_mul"(i64 %t1259, i64 %t1260)
  %t1262 = call i64 @"sx_f64_sub"(i64 %t1258, i64 %t1261)
  store i64 %t1262, ptr %local.w2.1086
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1263 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1264 = load i64, ptr %local.dim.1091
  %t1265 = icmp eq i64 %t1264, 3
  %t1266 = zext i1 %t1265 to i64
  %t1267 = icmp ne i64 %t1266, 0
  br i1 %t1267, label %then40, label %else40
then40:
  %t1268 = load i64, ptr %local.w3.1087
  %t1269 = load i64, ptr %local.lr.1097
  %t1270 = load i64, ptr %local.upd.1096
  %t1271 = call i64 @"sx_f64_mul"(i64 %t1269, i64 %t1270)
  %t1272 = call i64 @"sx_f64_sub"(i64 %t1268, i64 %t1271)
  store i64 %t1272, ptr %local.w3.1087
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1273 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1274 = load i64, ptr %local.dim.1091
  %t1275 = icmp eq i64 %t1274, 4
  %t1276 = zext i1 %t1275 to i64
  %t1277 = icmp ne i64 %t1276, 0
  br i1 %t1277, label %then41, label %else41
then41:
  %t1278 = load i64, ptr %local.w4.1088
  %t1279 = load i64, ptr %local.lr.1097
  %t1280 = load i64, ptr %local.upd.1096
  %t1281 = call i64 @"sx_f64_mul"(i64 %t1279, i64 %t1280)
  %t1282 = call i64 @"sx_f64_sub"(i64 %t1278, i64 %t1281)
  store i64 %t1282, ptr %local.w4.1088
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1283 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t1284 = load i64, ptr %local.dim.1091
  %t1285 = icmp eq i64 %t1284, 5
  %t1286 = zext i1 %t1285 to i64
  %t1287 = icmp ne i64 %t1286, 0
  br i1 %t1287, label %then42, label %else42
then42:
  %t1288 = load i64, ptr %local.w5.1089
  %t1289 = load i64, ptr %local.lr.1097
  %t1290 = load i64, ptr %local.upd.1096
  %t1291 = call i64 @"sx_f64_mul"(i64 %t1289, i64 %t1290)
  %t1292 = call i64 @"sx_f64_sub"(i64 %t1288, i64 %t1291)
  store i64 %t1292, ptr %local.w5.1089
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1293 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t1294 = load i64, ptr %local.dim.1091
  %t1295 = add i64 %t1294, 1
  store i64 %t1295, ptr %local.dim.1091
  br label %loop36
endloop36:
  %t1296 = load i64, ptr %local.step.1090
  %t1297 = add i64 %t1296, 1
  store i64 %t1297, ptr %local.step.1090
  br label %loop35
endloop35:
  %t1298 = load i64, ptr %local.which_pass
  %t1299 = icmp eq i64 %t1298, 0
  %t1300 = zext i1 %t1299 to i64
  %t1301 = icmp ne i64 %t1300, 0
  br i1 %t1301, label %then43, label %else43
then43:
  %t1302 = load i64, ptr %local.w0.1084
  %t1303 = load i64, ptr %local.w1.1085
  %t1304 = load i64, ptr %local.w2.1086
  %t1305 = load i64, ptr %local.w3.1087
  %t1306 = load i64, ptr %local.w4.1088
  %t1307 = load i64, ptr %local.w5.1089
  %t1308 = call i64 @"loss_inline"(i64 %t1302, i64 %t1303, i64 %t1304, i64 %t1305, i64 %t1306, i64 %t1307)
  ret i64 %t1308
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1309 = phi i64 [ 0, %else43_end ]
  %t1310 = load i64, ptr %local.which_pass
  %t1311 = icmp eq i64 %t1310, 1
  %t1312 = zext i1 %t1311 to i64
  %t1313 = icmp ne i64 %t1312, 0
  br i1 %t1313, label %then44, label %else44
then44:
  %t1314 = load i64, ptr %local.w0.1084
  %t1315 = load i64, ptr %local.w1.1085
  %t1316 = load i64, ptr %local.w2.1086
  %t1317 = load i64, ptr %local.w3.1087
  %t1318 = load i64, ptr %local.w4.1088
  %t1319 = load i64, ptr %local.w5.1089
  %t1320 = call i64 @"loss_unroll"(i64 %t1314, i64 %t1315, i64 %t1316, i64 %t1317, i64 %t1318, i64 %t1319)
  ret i64 %t1320
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1321 = phi i64 [ 0, %else44_end ]
  %t1322 = load i64, ptr %local.which_pass
  %t1323 = icmp eq i64 %t1322, 2
  %t1324 = zext i1 %t1323 to i64
  %t1325 = icmp ne i64 %t1324, 0
  br i1 %t1325, label %then45, label %else45
then45:
  %t1326 = load i64, ptr %local.w0.1084
  %t1327 = load i64, ptr %local.w1.1085
  %t1328 = load i64, ptr %local.w2.1086
  %t1329 = load i64, ptr %local.w3.1087
  %t1330 = load i64, ptr %local.w4.1088
  %t1331 = load i64, ptr %local.w5.1089
  %t1332 = call i64 @"loss_constfold"(i64 %t1326, i64 %t1327, i64 %t1328, i64 %t1329, i64 %t1330, i64 %t1331)
  ret i64 %t1332
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1333 = phi i64 [ 0, %else45_end ]
  %t1334 = load i64, ptr %local.w0.1084
  %t1335 = load i64, ptr %local.w1.1085
  %t1336 = load i64, ptr %local.w2.1086
  %t1337 = load i64, ptr %local.w3.1087
  %t1338 = load i64, ptr %local.w4.1088
  %t1339 = load i64, ptr %local.w5.1089
  %t1340 = call i64 @"loss_simd"(i64 %t1334, i64 %t1335, i64 %t1336, i64 %t1337, i64 %t1338, i64 %t1339)
  ret i64 %t1340
}

define i64 @"perturbed_loss"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %b0, i64 %b1, i64 %b2, i64 %b3, i64 %which, i64 %delta, i64 %steps) nounwind {
entry:
  %local.v01.1341 = alloca i64
  %local.v02.1342 = alloca i64
  %local.v03.1343 = alloca i64
  %local.v10.1344 = alloca i64
  %local.v12.1345 = alloca i64
  %local.v13.1346 = alloca i64
  %local.v20.1347 = alloca i64
  %local.v21.1348 = alloca i64
  %local.v23.1349 = alloca i64
  %local.v30.1350 = alloca i64
  %local.v31.1351 = alloca i64
  %local.v32.1352 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.delta = alloca i64
  store i64 %delta, ptr %local.delta
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1353 = load i64, ptr %local.a01
  store i64 %t1353, ptr %local.v01.1341
  %t1354 = load i64, ptr %local.a02
  store i64 %t1354, ptr %local.v02.1342
  %t1355 = load i64, ptr %local.a03
  store i64 %t1355, ptr %local.v03.1343
  %t1356 = load i64, ptr %local.a10
  store i64 %t1356, ptr %local.v10.1344
  %t1357 = load i64, ptr %local.a12
  store i64 %t1357, ptr %local.v12.1345
  %t1358 = load i64, ptr %local.a13
  store i64 %t1358, ptr %local.v13.1346
  %t1359 = load i64, ptr %local.a20
  store i64 %t1359, ptr %local.v20.1347
  %t1360 = load i64, ptr %local.a21
  store i64 %t1360, ptr %local.v21.1348
  %t1361 = load i64, ptr %local.a23
  store i64 %t1361, ptr %local.v23.1349
  %t1362 = load i64, ptr %local.a30
  store i64 %t1362, ptr %local.v30.1350
  %t1363 = load i64, ptr %local.a31
  store i64 %t1363, ptr %local.v31.1351
  %t1364 = load i64, ptr %local.a32
  store i64 %t1364, ptr %local.v32.1352
  %t1365 = load i64, ptr %local.which
  %t1366 = icmp eq i64 %t1365, 0
  %t1367 = zext i1 %t1366 to i64
  %t1368 = icmp ne i64 %t1367, 0
  br i1 %t1368, label %then46, label %else46
then46:
  %t1369 = load i64, ptr %local.a01
  %t1370 = load i64, ptr %local.delta
  %t1371 = call i64 @"sx_f64_add"(i64 %t1369, i64 %t1370)
  store i64 %t1371, ptr %local.v01.1341
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1372 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t1373 = load i64, ptr %local.which
  %t1374 = icmp eq i64 %t1373, 1
  %t1375 = zext i1 %t1374 to i64
  %t1376 = icmp ne i64 %t1375, 0
  br i1 %t1376, label %then47, label %else47
then47:
  %t1377 = load i64, ptr %local.a02
  %t1378 = load i64, ptr %local.delta
  %t1379 = call i64 @"sx_f64_add"(i64 %t1377, i64 %t1378)
  store i64 %t1379, ptr %local.v02.1342
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1380 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t1381 = load i64, ptr %local.which
  %t1382 = icmp eq i64 %t1381, 2
  %t1383 = zext i1 %t1382 to i64
  %t1384 = icmp ne i64 %t1383, 0
  br i1 %t1384, label %then48, label %else48
then48:
  %t1385 = load i64, ptr %local.a03
  %t1386 = load i64, ptr %local.delta
  %t1387 = call i64 @"sx_f64_add"(i64 %t1385, i64 %t1386)
  store i64 %t1387, ptr %local.v03.1343
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1388 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1389 = load i64, ptr %local.which
  %t1390 = icmp eq i64 %t1389, 3
  %t1391 = zext i1 %t1390 to i64
  %t1392 = icmp ne i64 %t1391, 0
  br i1 %t1392, label %then49, label %else49
then49:
  %t1393 = load i64, ptr %local.a10
  %t1394 = load i64, ptr %local.delta
  %t1395 = call i64 @"sx_f64_add"(i64 %t1393, i64 %t1394)
  store i64 %t1395, ptr %local.v10.1344
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1396 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t1397 = load i64, ptr %local.which
  %t1398 = icmp eq i64 %t1397, 4
  %t1399 = zext i1 %t1398 to i64
  %t1400 = icmp ne i64 %t1399, 0
  br i1 %t1400, label %then50, label %else50
then50:
  %t1401 = load i64, ptr %local.a12
  %t1402 = load i64, ptr %local.delta
  %t1403 = call i64 @"sx_f64_add"(i64 %t1401, i64 %t1402)
  store i64 %t1403, ptr %local.v12.1345
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1404 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t1405 = load i64, ptr %local.which
  %t1406 = icmp eq i64 %t1405, 5
  %t1407 = zext i1 %t1406 to i64
  %t1408 = icmp ne i64 %t1407, 0
  br i1 %t1408, label %then51, label %else51
then51:
  %t1409 = load i64, ptr %local.a13
  %t1410 = load i64, ptr %local.delta
  %t1411 = call i64 @"sx_f64_add"(i64 %t1409, i64 %t1410)
  store i64 %t1411, ptr %local.v13.1346
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1412 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t1413 = load i64, ptr %local.which
  %t1414 = icmp eq i64 %t1413, 6
  %t1415 = zext i1 %t1414 to i64
  %t1416 = icmp ne i64 %t1415, 0
  br i1 %t1416, label %then52, label %else52
then52:
  %t1417 = load i64, ptr %local.a20
  %t1418 = load i64, ptr %local.delta
  %t1419 = call i64 @"sx_f64_add"(i64 %t1417, i64 %t1418)
  store i64 %t1419, ptr %local.v20.1347
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1420 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t1421 = load i64, ptr %local.which
  %t1422 = icmp eq i64 %t1421, 7
  %t1423 = zext i1 %t1422 to i64
  %t1424 = icmp ne i64 %t1423, 0
  br i1 %t1424, label %then53, label %else53
then53:
  %t1425 = load i64, ptr %local.a21
  %t1426 = load i64, ptr %local.delta
  %t1427 = call i64 @"sx_f64_add"(i64 %t1425, i64 %t1426)
  store i64 %t1427, ptr %local.v21.1348
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1428 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t1429 = load i64, ptr %local.which
  %t1430 = icmp eq i64 %t1429, 8
  %t1431 = zext i1 %t1430 to i64
  %t1432 = icmp ne i64 %t1431, 0
  br i1 %t1432, label %then54, label %else54
then54:
  %t1433 = load i64, ptr %local.a23
  %t1434 = load i64, ptr %local.delta
  %t1435 = call i64 @"sx_f64_add"(i64 %t1433, i64 %t1434)
  store i64 %t1435, ptr %local.v23.1349
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t1436 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t1437 = load i64, ptr %local.which
  %t1438 = icmp eq i64 %t1437, 9
  %t1439 = zext i1 %t1438 to i64
  %t1440 = icmp ne i64 %t1439, 0
  br i1 %t1440, label %then55, label %else55
then55:
  %t1441 = load i64, ptr %local.a30
  %t1442 = load i64, ptr %local.delta
  %t1443 = call i64 @"sx_f64_add"(i64 %t1441, i64 %t1442)
  store i64 %t1443, ptr %local.v30.1350
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t1444 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t1445 = load i64, ptr %local.which
  %t1446 = icmp eq i64 %t1445, 10
  %t1447 = zext i1 %t1446 to i64
  %t1448 = icmp ne i64 %t1447, 0
  br i1 %t1448, label %then56, label %else56
then56:
  %t1449 = load i64, ptr %local.a31
  %t1450 = load i64, ptr %local.delta
  %t1451 = call i64 @"sx_f64_add"(i64 %t1449, i64 %t1450)
  store i64 %t1451, ptr %local.v31.1351
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t1452 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t1453 = load i64, ptr %local.which
  %t1454 = icmp eq i64 %t1453, 11
  %t1455 = zext i1 %t1454 to i64
  %t1456 = icmp ne i64 %t1455, 0
  br i1 %t1456, label %then57, label %else57
then57:
  %t1457 = load i64, ptr %local.a32
  %t1458 = load i64, ptr %local.delta
  %t1459 = call i64 @"sx_f64_add"(i64 %t1457, i64 %t1458)
  store i64 %t1459, ptr %local.v32.1352
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t1460 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t1461 = load i64, ptr %local.v01.1341
  %t1462 = load i64, ptr %local.v02.1342
  %t1463 = load i64, ptr %local.v03.1343
  %t1464 = load i64, ptr %local.v10.1344
  %t1465 = load i64, ptr %local.v12.1345
  %t1466 = load i64, ptr %local.v13.1346
  %t1467 = load i64, ptr %local.v20.1347
  %t1468 = load i64, ptr %local.v21.1348
  %t1469 = load i64, ptr %local.v23.1349
  %t1470 = load i64, ptr %local.v30.1350
  %t1471 = load i64, ptr %local.v31.1351
  %t1472 = load i64, ptr %local.v32.1352
  %t1473 = load i64, ptr %local.b0
  %t1474 = load i64, ptr %local.b1
  %t1475 = load i64, ptr %local.b2
  %t1476 = load i64, ptr %local.b3
  %t1477 = load i64, ptr %local.steps
  %t1478 = call i64 @"run_inner"(i64 %t1461, i64 %t1462, i64 %t1463, i64 %t1464, i64 %t1465, i64 %t1466, i64 %t1467, i64 %t1468, i64 %t1469, i64 %t1470, i64 %t1471, i64 %t1472, i64 %t1473, i64 %t1474, i64 %t1475, i64 %t1476, i64 %t1477)
  ret i64 %t1478
}

define i64 @"meta_grad_one"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %b0, i64 %b1, i64 %b2, i64 %b3, i64 %which, i64 %steps) nounwind {
entry:
  %local.h.1479 = alloca i64
  %local.lp.1480 = alloca i64
  %local.lm.1481 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1482 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.94)
  store i64 %t1482, ptr %local.h.1479
  %t1483 = load i64, ptr %local.a01
  %t1484 = load i64, ptr %local.a02
  %t1485 = load i64, ptr %local.a03
  %t1486 = load i64, ptr %local.a10
  %t1487 = load i64, ptr %local.a12
  %t1488 = load i64, ptr %local.a13
  %t1489 = load i64, ptr %local.a20
  %t1490 = load i64, ptr %local.a21
  %t1491 = load i64, ptr %local.a23
  %t1492 = load i64, ptr %local.a30
  %t1493 = load i64, ptr %local.a31
  %t1494 = load i64, ptr %local.a32
  %t1495 = load i64, ptr %local.b0
  %t1496 = load i64, ptr %local.b1
  %t1497 = load i64, ptr %local.b2
  %t1498 = load i64, ptr %local.b3
  %t1499 = load i64, ptr %local.which
  %t1500 = load i64, ptr %local.h.1479
  %t1501 = load i64, ptr %local.steps
  %t1502 = call i64 @"perturbed_loss"(i64 %t1483, i64 %t1484, i64 %t1485, i64 %t1486, i64 %t1487, i64 %t1488, i64 %t1489, i64 %t1490, i64 %t1491, i64 %t1492, i64 %t1493, i64 %t1494, i64 %t1495, i64 %t1496, i64 %t1497, i64 %t1498, i64 %t1499, i64 %t1500, i64 %t1501)
  store i64 %t1502, ptr %local.lp.1480
  %t1503 = load i64, ptr %local.a01
  %t1504 = load i64, ptr %local.a02
  %t1505 = load i64, ptr %local.a03
  %t1506 = load i64, ptr %local.a10
  %t1507 = load i64, ptr %local.a12
  %t1508 = load i64, ptr %local.a13
  %t1509 = load i64, ptr %local.a20
  %t1510 = load i64, ptr %local.a21
  %t1511 = load i64, ptr %local.a23
  %t1512 = load i64, ptr %local.a30
  %t1513 = load i64, ptr %local.a31
  %t1514 = load i64, ptr %local.a32
  %t1515 = load i64, ptr %local.b0
  %t1516 = load i64, ptr %local.b1
  %t1517 = load i64, ptr %local.b2
  %t1518 = load i64, ptr %local.b3
  %t1519 = load i64, ptr %local.which
  %t1520 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.95)
  %t1521 = load i64, ptr %local.h.1479
  %t1522 = call i64 @"sx_f64_sub"(i64 %t1520, i64 %t1521)
  %t1523 = load i64, ptr %local.steps
  %t1524 = call i64 @"perturbed_loss"(i64 %t1503, i64 %t1504, i64 %t1505, i64 %t1506, i64 %t1507, i64 %t1508, i64 %t1509, i64 %t1510, i64 %t1511, i64 %t1512, i64 %t1513, i64 %t1514, i64 %t1515, i64 %t1516, i64 %t1517, i64 %t1518, i64 %t1519, i64 %t1522, i64 %t1523)
  store i64 %t1524, ptr %local.lm.1481
  %t1525 = load i64, ptr %local.lp.1480
  %t1526 = load i64, ptr %local.lm.1481
  %t1527 = call i64 @"sx_f64_sub"(i64 %t1525, i64 %t1526)
  %t1528 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.96)
  %t1529 = load i64, ptr %local.h.1479
  %t1530 = call i64 @"sx_f64_mul"(i64 %t1528, i64 %t1529)
  %t1531 = call i64 @"sx_f64_div"(i64 %t1527, i64 %t1530)
  ret i64 %t1531
}

define i64 @"print_alpha_label"(i64 %i, i64 %j) nounwind {
entry:
  %local.i = alloca i64
  store i64 %i, ptr %local.i
  %local.j = alloca i64
  store i64 %j, ptr %local.j
  %t1532 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.97)
  %t1533 = ptrtoint ptr %t1532 to i64
  %t1534 = inttoptr i64 %t1533 to ptr
  call void @intrinsic_print(ptr %t1534)
  %t1535 = load i64, ptr %local.i
  call void @print_i64(i64 %t1535)
  %t1536 = load i64, ptr %local.j
  call void @print_i64(i64 %t1536)
  %t1537 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.98)
  %t1538 = ptrtoint ptr %t1537 to i64
  %t1539 = inttoptr i64 %t1538 to ptr
  call void @intrinsic_print(ptr %t1539)
  ret i64 0
}

define i64 @"print_matrix_4x4"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32) nounwind {
entry:
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %t1540 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.99)
  %t1541 = ptrtoint ptr %t1540 to i64
  %t1542 = inttoptr i64 %t1541 to ptr
  call void @intrinsic_print(ptr %t1542)
  %t1543 = load i64, ptr %local.a01
  %t1544 = call i64 @"print_f64"(i64 %t1543)
  %t1545 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.100)
  %t1546 = ptrtoint ptr %t1545 to i64
  %t1547 = inttoptr i64 %t1546 to ptr
  call void @intrinsic_print(ptr %t1547)
  %t1548 = load i64, ptr %local.a02
  %t1549 = call i64 @"print_f64"(i64 %t1548)
  %t1550 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.101)
  %t1551 = ptrtoint ptr %t1550 to i64
  %t1552 = inttoptr i64 %t1551 to ptr
  call void @intrinsic_print(ptr %t1552)
  %t1553 = load i64, ptr %local.a03
  %t1554 = call i64 @"print_f64"(i64 %t1553)
  %t1555 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.102)
  %t1556 = ptrtoint ptr %t1555 to i64
  %t1557 = inttoptr i64 %t1556 to ptr
  call void @intrinsic_println(ptr %t1557)
  %t1558 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.103)
  %t1559 = ptrtoint ptr %t1558 to i64
  %t1560 = inttoptr i64 %t1559 to ptr
  call void @intrinsic_print(ptr %t1560)
  %t1561 = load i64, ptr %local.a10
  %t1562 = call i64 @"print_f64"(i64 %t1561)
  %t1563 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.104)
  %t1564 = ptrtoint ptr %t1563 to i64
  %t1565 = inttoptr i64 %t1564 to ptr
  call void @intrinsic_print(ptr %t1565)
  %t1566 = load i64, ptr %local.a12
  %t1567 = call i64 @"print_f64"(i64 %t1566)
  %t1568 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.105)
  %t1569 = ptrtoint ptr %t1568 to i64
  %t1570 = inttoptr i64 %t1569 to ptr
  call void @intrinsic_print(ptr %t1570)
  %t1571 = load i64, ptr %local.a13
  %t1572 = call i64 @"print_f64"(i64 %t1571)
  %t1573 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.106)
  %t1574 = ptrtoint ptr %t1573 to i64
  %t1575 = inttoptr i64 %t1574 to ptr
  call void @intrinsic_println(ptr %t1575)
  %t1576 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.107)
  %t1577 = ptrtoint ptr %t1576 to i64
  %t1578 = inttoptr i64 %t1577 to ptr
  call void @intrinsic_print(ptr %t1578)
  %t1579 = load i64, ptr %local.a20
  %t1580 = call i64 @"print_f64"(i64 %t1579)
  %t1581 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.108)
  %t1582 = ptrtoint ptr %t1581 to i64
  %t1583 = inttoptr i64 %t1582 to ptr
  call void @intrinsic_print(ptr %t1583)
  %t1584 = load i64, ptr %local.a21
  %t1585 = call i64 @"print_f64"(i64 %t1584)
  %t1586 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.109)
  %t1587 = ptrtoint ptr %t1586 to i64
  %t1588 = inttoptr i64 %t1587 to ptr
  call void @intrinsic_print(ptr %t1588)
  %t1589 = load i64, ptr %local.a23
  %t1590 = call i64 @"print_f64"(i64 %t1589)
  %t1591 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.110)
  %t1592 = ptrtoint ptr %t1591 to i64
  %t1593 = inttoptr i64 %t1592 to ptr
  call void @intrinsic_println(ptr %t1593)
  %t1594 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.111)
  %t1595 = ptrtoint ptr %t1594 to i64
  %t1596 = inttoptr i64 %t1595 to ptr
  call void @intrinsic_print(ptr %t1596)
  %t1597 = load i64, ptr %local.a30
  %t1598 = call i64 @"print_f64"(i64 %t1597)
  %t1599 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.112)
  %t1600 = ptrtoint ptr %t1599 to i64
  %t1601 = inttoptr i64 %t1600 to ptr
  call void @intrinsic_print(ptr %t1601)
  %t1602 = load i64, ptr %local.a31
  %t1603 = call i64 @"print_f64"(i64 %t1602)
  %t1604 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.113)
  %t1605 = ptrtoint ptr %t1604 to i64
  %t1606 = inttoptr i64 %t1605 to ptr
  call void @intrinsic_print(ptr %t1606)
  %t1607 = load i64, ptr %local.a32
  %t1608 = call i64 @"print_f64"(i64 %t1607)
  %t1609 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.114)
  %t1610 = ptrtoint ptr %t1609 to i64
  %t1611 = inttoptr i64 %t1610 to ptr
  call void @intrinsic_println(ptr %t1611)
  ret i64 0
}

define i64 @"experiment_1"() nounwind {
entry:
  %local.a01.1612 = alloca i64
  %local.a02.1613 = alloca i64
  %local.a03.1614 = alloca i64
  %local.a10.1615 = alloca i64
  %local.a12.1616 = alloca i64
  %local.a13.1617 = alloca i64
  %local.a20.1618 = alloca i64
  %local.a21.1619 = alloca i64
  %local.a23.1620 = alloca i64
  %local.a30.1621 = alloca i64
  %local.a31.1622 = alloca i64
  %local.a32.1623 = alloca i64
  %local.mg.1624 = alloca i64
  %local.cycle.1625 = alloca i64
  %local.loss.1626 = alloca i64
  %local.meta_lr.1627 = alloca i64
  %local.inner_steps.1628 = alloca i64
  %local.meta_cycles.1629 = alloca i64
  %local.loss_none.1630 = alloca i64
  %local.loss_uniform.1631 = alloca i64
  %local.final_loss.1632 = alloca i64
  %local.dummy.1633 = alloca i64
  %local.avg_cf_out.1634 = alloca i64
  %local.avg_cf_in.1635 = alloca i64
  %local.inline_unroll.1636 = alloca i64
  %local.inline_simd.1637 = alloca i64
  %t1638 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.115)
  store i64 %t1638, ptr %local.a01.1612
  %t1639 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.116)
  store i64 %t1639, ptr %local.a02.1613
  %t1640 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.117)
  store i64 %t1640, ptr %local.a03.1614
  %t1641 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.118)
  store i64 %t1641, ptr %local.a10.1615
  %t1642 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.119)
  store i64 %t1642, ptr %local.a12.1616
  %t1643 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.120)
  store i64 %t1643, ptr %local.a13.1617
  %t1644 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.121)
  store i64 %t1644, ptr %local.a20.1618
  %t1645 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.122)
  store i64 %t1645, ptr %local.a21.1619
  %t1646 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.123)
  store i64 %t1646, ptr %local.a23.1620
  %t1647 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.124)
  store i64 %t1647, ptr %local.a30.1621
  %t1648 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.125)
  store i64 %t1648, ptr %local.a31.1622
  %t1649 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.126)
  store i64 %t1649, ptr %local.a32.1623
  %t1650 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.127)
  store i64 %t1650, ptr %local.mg.1624
  store i64 0, ptr %local.cycle.1625
  %t1651 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.128)
  store i64 %t1651, ptr %local.loss.1626
  %t1652 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.129)
  store i64 %t1652, ptr %local.meta_lr.1627
  store i64 200, ptr %local.inner_steps.1628
  store i64 50, ptr %local.meta_cycles.1629
  %t1653 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.130)
  %t1654 = ptrtoint ptr %t1653 to i64
  %t1655 = inttoptr i64 %t1654 to ptr
  call void @intrinsic_println(ptr %t1655)
  %t1656 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.131)
  %t1657 = ptrtoint ptr %t1656 to i64
  %t1658 = inttoptr i64 %t1657 to ptr
  call void @intrinsic_println(ptr %t1658)
  %t1659 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.132)
  %t1660 = ptrtoint ptr %t1659 to i64
  %t1661 = inttoptr i64 %t1660 to ptr
  call void @intrinsic_println(ptr %t1661)
  %t1662 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.133)
  %t1663 = ptrtoint ptr %t1662 to i64
  %t1664 = inttoptr i64 %t1663 to ptr
  call void @intrinsic_println(ptr %t1664)
  %t1665 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.134)
  %t1666 = ptrtoint ptr %t1665 to i64
  %t1667 = inttoptr i64 %t1666 to ptr
  call void @intrinsic_println(ptr %t1667)
  %t1668 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.135)
  %t1669 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.136)
  %t1670 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.137)
  %t1671 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.138)
  %t1672 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.139)
  %t1673 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.140)
  %t1674 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.141)
  %t1675 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.142)
  %t1676 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.143)
  %t1677 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.144)
  %t1678 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.145)
  %t1679 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.146)
  %t1680 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.147)
  %t1681 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.148)
  %t1682 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.149)
  %t1683 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.150)
  %t1684 = load i64, ptr %local.inner_steps.1628
  %t1685 = call i64 @"run_inner"(i64 %t1668, i64 %t1669, i64 %t1670, i64 %t1671, i64 %t1672, i64 %t1673, i64 %t1674, i64 %t1675, i64 %t1676, i64 %t1677, i64 %t1678, i64 %t1679, i64 %t1680, i64 %t1681, i64 %t1682, i64 %t1683, i64 %t1684)
  store i64 %t1685, ptr %local.loss_none.1630
  %t1686 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.151)
  %t1687 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.152)
  %t1688 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.153)
  %t1689 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.154)
  %t1690 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.155)
  %t1691 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.156)
  %t1692 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.157)
  %t1693 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.158)
  %t1694 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.159)
  %t1695 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.160)
  %t1696 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.161)
  %t1697 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.162)
  %t1698 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.163)
  %t1699 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.164)
  %t1700 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.165)
  %t1701 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.166)
  %t1702 = load i64, ptr %local.inner_steps.1628
  %t1703 = call i64 @"run_inner"(i64 %t1686, i64 %t1687, i64 %t1688, i64 %t1689, i64 %t1690, i64 %t1691, i64 %t1692, i64 %t1693, i64 %t1694, i64 %t1695, i64 %t1696, i64 %t1697, i64 %t1698, i64 %t1699, i64 %t1700, i64 %t1701, i64 %t1702)
  store i64 %t1703, ptr %local.loss_uniform.1631
  %t1704 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.167)
  %t1705 = ptrtoint ptr %t1704 to i64
  %t1706 = inttoptr i64 %t1705 to ptr
  call void @intrinsic_print(ptr %t1706)
  %t1707 = load i64, ptr %local.loss_none.1630
  %t1708 = call i64 @"print_f64"(i64 %t1707)
  %t1709 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.168)
  %t1710 = ptrtoint ptr %t1709 to i64
  %t1711 = inttoptr i64 %t1710 to ptr
  call void @intrinsic_println(ptr %t1711)
  %t1712 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.169)
  %t1713 = ptrtoint ptr %t1712 to i64
  %t1714 = inttoptr i64 %t1713 to ptr
  call void @intrinsic_print(ptr %t1714)
  %t1715 = load i64, ptr %local.loss_uniform.1631
  %t1716 = call i64 @"print_f64"(i64 %t1715)
  %t1717 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.170)
  %t1718 = ptrtoint ptr %t1717 to i64
  %t1719 = inttoptr i64 %t1718 to ptr
  call void @intrinsic_println(ptr %t1719)
  %t1720 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.171)
  %t1721 = ptrtoint ptr %t1720 to i64
  %t1722 = inttoptr i64 %t1721 to ptr
  call void @intrinsic_println(ptr %t1722)
  %t1723 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.172)
  %t1724 = ptrtoint ptr %t1723 to i64
  %t1725 = inttoptr i64 %t1724 to ptr
  call void @intrinsic_println(ptr %t1725)
  br label %loop58
loop58:
  %t1726 = load i64, ptr %local.cycle.1625
  %t1727 = load i64, ptr %local.meta_cycles.1629
  %t1728 = icmp slt i64 %t1726, %t1727
  %t1729 = zext i1 %t1728 to i64
  %t1730 = icmp ne i64 %t1729, 0
  br i1 %t1730, label %body58, label %endloop58
body58:
  %t1731 = load i64, ptr %local.a01.1612
  %t1732 = load i64, ptr %local.a02.1613
  %t1733 = load i64, ptr %local.a03.1614
  %t1734 = load i64, ptr %local.a10.1615
  %t1735 = load i64, ptr %local.a12.1616
  %t1736 = load i64, ptr %local.a13.1617
  %t1737 = load i64, ptr %local.a20.1618
  %t1738 = load i64, ptr %local.a21.1619
  %t1739 = load i64, ptr %local.a23.1620
  %t1740 = load i64, ptr %local.a30.1621
  %t1741 = load i64, ptr %local.a31.1622
  %t1742 = load i64, ptr %local.a32.1623
  %t1743 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.173)
  %t1744 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.174)
  %t1745 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.175)
  %t1746 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.176)
  %t1747 = load i64, ptr %local.inner_steps.1628
  %t1748 = call i64 @"meta_grad_one"(i64 %t1731, i64 %t1732, i64 %t1733, i64 %t1734, i64 %t1735, i64 %t1736, i64 %t1737, i64 %t1738, i64 %t1739, i64 %t1740, i64 %t1741, i64 %t1742, i64 %t1743, i64 %t1744, i64 %t1745, i64 %t1746, i64 0, i64 %t1747)
  store i64 %t1748, ptr %local.mg.1624
  %t1749 = load i64, ptr %local.a01.1612
  %t1750 = load i64, ptr %local.meta_lr.1627
  %t1751 = load i64, ptr %local.mg.1624
  %t1752 = call i64 @"sx_f64_mul"(i64 %t1750, i64 %t1751)
  %t1753 = call i64 @"sx_f64_sub"(i64 %t1749, i64 %t1752)
  %t1754 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.177)
  %t1755 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.178)
  %t1756 = call i64 @"clamp"(i64 %t1753, i64 %t1754, i64 %t1755)
  store i64 %t1756, ptr %local.a01.1612
  %t1757 = load i64, ptr %local.a01.1612
  %t1758 = load i64, ptr %local.a02.1613
  %t1759 = load i64, ptr %local.a03.1614
  %t1760 = load i64, ptr %local.a10.1615
  %t1761 = load i64, ptr %local.a12.1616
  %t1762 = load i64, ptr %local.a13.1617
  %t1763 = load i64, ptr %local.a20.1618
  %t1764 = load i64, ptr %local.a21.1619
  %t1765 = load i64, ptr %local.a23.1620
  %t1766 = load i64, ptr %local.a30.1621
  %t1767 = load i64, ptr %local.a31.1622
  %t1768 = load i64, ptr %local.a32.1623
  %t1769 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.179)
  %t1770 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.180)
  %t1771 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.181)
  %t1772 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.182)
  %t1773 = load i64, ptr %local.inner_steps.1628
  %t1774 = call i64 @"meta_grad_one"(i64 %t1757, i64 %t1758, i64 %t1759, i64 %t1760, i64 %t1761, i64 %t1762, i64 %t1763, i64 %t1764, i64 %t1765, i64 %t1766, i64 %t1767, i64 %t1768, i64 %t1769, i64 %t1770, i64 %t1771, i64 %t1772, i64 1, i64 %t1773)
  store i64 %t1774, ptr %local.mg.1624
  %t1775 = load i64, ptr %local.a02.1613
  %t1776 = load i64, ptr %local.meta_lr.1627
  %t1777 = load i64, ptr %local.mg.1624
  %t1778 = call i64 @"sx_f64_mul"(i64 %t1776, i64 %t1777)
  %t1779 = call i64 @"sx_f64_sub"(i64 %t1775, i64 %t1778)
  %t1780 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.183)
  %t1781 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.184)
  %t1782 = call i64 @"clamp"(i64 %t1779, i64 %t1780, i64 %t1781)
  store i64 %t1782, ptr %local.a02.1613
  %t1783 = load i64, ptr %local.a01.1612
  %t1784 = load i64, ptr %local.a02.1613
  %t1785 = load i64, ptr %local.a03.1614
  %t1786 = load i64, ptr %local.a10.1615
  %t1787 = load i64, ptr %local.a12.1616
  %t1788 = load i64, ptr %local.a13.1617
  %t1789 = load i64, ptr %local.a20.1618
  %t1790 = load i64, ptr %local.a21.1619
  %t1791 = load i64, ptr %local.a23.1620
  %t1792 = load i64, ptr %local.a30.1621
  %t1793 = load i64, ptr %local.a31.1622
  %t1794 = load i64, ptr %local.a32.1623
  %t1795 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.185)
  %t1796 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.186)
  %t1797 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.187)
  %t1798 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.188)
  %t1799 = load i64, ptr %local.inner_steps.1628
  %t1800 = call i64 @"meta_grad_one"(i64 %t1783, i64 %t1784, i64 %t1785, i64 %t1786, i64 %t1787, i64 %t1788, i64 %t1789, i64 %t1790, i64 %t1791, i64 %t1792, i64 %t1793, i64 %t1794, i64 %t1795, i64 %t1796, i64 %t1797, i64 %t1798, i64 2, i64 %t1799)
  store i64 %t1800, ptr %local.mg.1624
  %t1801 = load i64, ptr %local.a03.1614
  %t1802 = load i64, ptr %local.meta_lr.1627
  %t1803 = load i64, ptr %local.mg.1624
  %t1804 = call i64 @"sx_f64_mul"(i64 %t1802, i64 %t1803)
  %t1805 = call i64 @"sx_f64_sub"(i64 %t1801, i64 %t1804)
  %t1806 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.189)
  %t1807 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.190)
  %t1808 = call i64 @"clamp"(i64 %t1805, i64 %t1806, i64 %t1807)
  store i64 %t1808, ptr %local.a03.1614
  %t1809 = load i64, ptr %local.a01.1612
  %t1810 = load i64, ptr %local.a02.1613
  %t1811 = load i64, ptr %local.a03.1614
  %t1812 = load i64, ptr %local.a10.1615
  %t1813 = load i64, ptr %local.a12.1616
  %t1814 = load i64, ptr %local.a13.1617
  %t1815 = load i64, ptr %local.a20.1618
  %t1816 = load i64, ptr %local.a21.1619
  %t1817 = load i64, ptr %local.a23.1620
  %t1818 = load i64, ptr %local.a30.1621
  %t1819 = load i64, ptr %local.a31.1622
  %t1820 = load i64, ptr %local.a32.1623
  %t1821 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.191)
  %t1822 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.192)
  %t1823 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.193)
  %t1824 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.194)
  %t1825 = load i64, ptr %local.inner_steps.1628
  %t1826 = call i64 @"meta_grad_one"(i64 %t1809, i64 %t1810, i64 %t1811, i64 %t1812, i64 %t1813, i64 %t1814, i64 %t1815, i64 %t1816, i64 %t1817, i64 %t1818, i64 %t1819, i64 %t1820, i64 %t1821, i64 %t1822, i64 %t1823, i64 %t1824, i64 3, i64 %t1825)
  store i64 %t1826, ptr %local.mg.1624
  %t1827 = load i64, ptr %local.a10.1615
  %t1828 = load i64, ptr %local.meta_lr.1627
  %t1829 = load i64, ptr %local.mg.1624
  %t1830 = call i64 @"sx_f64_mul"(i64 %t1828, i64 %t1829)
  %t1831 = call i64 @"sx_f64_sub"(i64 %t1827, i64 %t1830)
  %t1832 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.195)
  %t1833 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.196)
  %t1834 = call i64 @"clamp"(i64 %t1831, i64 %t1832, i64 %t1833)
  store i64 %t1834, ptr %local.a10.1615
  %t1835 = load i64, ptr %local.a01.1612
  %t1836 = load i64, ptr %local.a02.1613
  %t1837 = load i64, ptr %local.a03.1614
  %t1838 = load i64, ptr %local.a10.1615
  %t1839 = load i64, ptr %local.a12.1616
  %t1840 = load i64, ptr %local.a13.1617
  %t1841 = load i64, ptr %local.a20.1618
  %t1842 = load i64, ptr %local.a21.1619
  %t1843 = load i64, ptr %local.a23.1620
  %t1844 = load i64, ptr %local.a30.1621
  %t1845 = load i64, ptr %local.a31.1622
  %t1846 = load i64, ptr %local.a32.1623
  %t1847 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.197)
  %t1848 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.198)
  %t1849 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.199)
  %t1850 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.200)
  %t1851 = load i64, ptr %local.inner_steps.1628
  %t1852 = call i64 @"meta_grad_one"(i64 %t1835, i64 %t1836, i64 %t1837, i64 %t1838, i64 %t1839, i64 %t1840, i64 %t1841, i64 %t1842, i64 %t1843, i64 %t1844, i64 %t1845, i64 %t1846, i64 %t1847, i64 %t1848, i64 %t1849, i64 %t1850, i64 4, i64 %t1851)
  store i64 %t1852, ptr %local.mg.1624
  %t1853 = load i64, ptr %local.a12.1616
  %t1854 = load i64, ptr %local.meta_lr.1627
  %t1855 = load i64, ptr %local.mg.1624
  %t1856 = call i64 @"sx_f64_mul"(i64 %t1854, i64 %t1855)
  %t1857 = call i64 @"sx_f64_sub"(i64 %t1853, i64 %t1856)
  %t1858 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.201)
  %t1859 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.202)
  %t1860 = call i64 @"clamp"(i64 %t1857, i64 %t1858, i64 %t1859)
  store i64 %t1860, ptr %local.a12.1616
  %t1861 = load i64, ptr %local.a01.1612
  %t1862 = load i64, ptr %local.a02.1613
  %t1863 = load i64, ptr %local.a03.1614
  %t1864 = load i64, ptr %local.a10.1615
  %t1865 = load i64, ptr %local.a12.1616
  %t1866 = load i64, ptr %local.a13.1617
  %t1867 = load i64, ptr %local.a20.1618
  %t1868 = load i64, ptr %local.a21.1619
  %t1869 = load i64, ptr %local.a23.1620
  %t1870 = load i64, ptr %local.a30.1621
  %t1871 = load i64, ptr %local.a31.1622
  %t1872 = load i64, ptr %local.a32.1623
  %t1873 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.203)
  %t1874 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.204)
  %t1875 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.205)
  %t1876 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.206)
  %t1877 = load i64, ptr %local.inner_steps.1628
  %t1878 = call i64 @"meta_grad_one"(i64 %t1861, i64 %t1862, i64 %t1863, i64 %t1864, i64 %t1865, i64 %t1866, i64 %t1867, i64 %t1868, i64 %t1869, i64 %t1870, i64 %t1871, i64 %t1872, i64 %t1873, i64 %t1874, i64 %t1875, i64 %t1876, i64 5, i64 %t1877)
  store i64 %t1878, ptr %local.mg.1624
  %t1879 = load i64, ptr %local.a13.1617
  %t1880 = load i64, ptr %local.meta_lr.1627
  %t1881 = load i64, ptr %local.mg.1624
  %t1882 = call i64 @"sx_f64_mul"(i64 %t1880, i64 %t1881)
  %t1883 = call i64 @"sx_f64_sub"(i64 %t1879, i64 %t1882)
  %t1884 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.207)
  %t1885 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.208)
  %t1886 = call i64 @"clamp"(i64 %t1883, i64 %t1884, i64 %t1885)
  store i64 %t1886, ptr %local.a13.1617
  %t1887 = load i64, ptr %local.a01.1612
  %t1888 = load i64, ptr %local.a02.1613
  %t1889 = load i64, ptr %local.a03.1614
  %t1890 = load i64, ptr %local.a10.1615
  %t1891 = load i64, ptr %local.a12.1616
  %t1892 = load i64, ptr %local.a13.1617
  %t1893 = load i64, ptr %local.a20.1618
  %t1894 = load i64, ptr %local.a21.1619
  %t1895 = load i64, ptr %local.a23.1620
  %t1896 = load i64, ptr %local.a30.1621
  %t1897 = load i64, ptr %local.a31.1622
  %t1898 = load i64, ptr %local.a32.1623
  %t1899 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.209)
  %t1900 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.210)
  %t1901 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.211)
  %t1902 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.212)
  %t1903 = load i64, ptr %local.inner_steps.1628
  %t1904 = call i64 @"meta_grad_one"(i64 %t1887, i64 %t1888, i64 %t1889, i64 %t1890, i64 %t1891, i64 %t1892, i64 %t1893, i64 %t1894, i64 %t1895, i64 %t1896, i64 %t1897, i64 %t1898, i64 %t1899, i64 %t1900, i64 %t1901, i64 %t1902, i64 6, i64 %t1903)
  store i64 %t1904, ptr %local.mg.1624
  %t1905 = load i64, ptr %local.a20.1618
  %t1906 = load i64, ptr %local.meta_lr.1627
  %t1907 = load i64, ptr %local.mg.1624
  %t1908 = call i64 @"sx_f64_mul"(i64 %t1906, i64 %t1907)
  %t1909 = call i64 @"sx_f64_sub"(i64 %t1905, i64 %t1908)
  %t1910 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.213)
  %t1911 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.214)
  %t1912 = call i64 @"clamp"(i64 %t1909, i64 %t1910, i64 %t1911)
  store i64 %t1912, ptr %local.a20.1618
  %t1913 = load i64, ptr %local.a01.1612
  %t1914 = load i64, ptr %local.a02.1613
  %t1915 = load i64, ptr %local.a03.1614
  %t1916 = load i64, ptr %local.a10.1615
  %t1917 = load i64, ptr %local.a12.1616
  %t1918 = load i64, ptr %local.a13.1617
  %t1919 = load i64, ptr %local.a20.1618
  %t1920 = load i64, ptr %local.a21.1619
  %t1921 = load i64, ptr %local.a23.1620
  %t1922 = load i64, ptr %local.a30.1621
  %t1923 = load i64, ptr %local.a31.1622
  %t1924 = load i64, ptr %local.a32.1623
  %t1925 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.215)
  %t1926 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.216)
  %t1927 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.217)
  %t1928 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.218)
  %t1929 = load i64, ptr %local.inner_steps.1628
  %t1930 = call i64 @"meta_grad_one"(i64 %t1913, i64 %t1914, i64 %t1915, i64 %t1916, i64 %t1917, i64 %t1918, i64 %t1919, i64 %t1920, i64 %t1921, i64 %t1922, i64 %t1923, i64 %t1924, i64 %t1925, i64 %t1926, i64 %t1927, i64 %t1928, i64 7, i64 %t1929)
  store i64 %t1930, ptr %local.mg.1624
  %t1931 = load i64, ptr %local.a21.1619
  %t1932 = load i64, ptr %local.meta_lr.1627
  %t1933 = load i64, ptr %local.mg.1624
  %t1934 = call i64 @"sx_f64_mul"(i64 %t1932, i64 %t1933)
  %t1935 = call i64 @"sx_f64_sub"(i64 %t1931, i64 %t1934)
  %t1936 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.219)
  %t1937 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.220)
  %t1938 = call i64 @"clamp"(i64 %t1935, i64 %t1936, i64 %t1937)
  store i64 %t1938, ptr %local.a21.1619
  %t1939 = load i64, ptr %local.a01.1612
  %t1940 = load i64, ptr %local.a02.1613
  %t1941 = load i64, ptr %local.a03.1614
  %t1942 = load i64, ptr %local.a10.1615
  %t1943 = load i64, ptr %local.a12.1616
  %t1944 = load i64, ptr %local.a13.1617
  %t1945 = load i64, ptr %local.a20.1618
  %t1946 = load i64, ptr %local.a21.1619
  %t1947 = load i64, ptr %local.a23.1620
  %t1948 = load i64, ptr %local.a30.1621
  %t1949 = load i64, ptr %local.a31.1622
  %t1950 = load i64, ptr %local.a32.1623
  %t1951 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.221)
  %t1952 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.222)
  %t1953 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.223)
  %t1954 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.224)
  %t1955 = load i64, ptr %local.inner_steps.1628
  %t1956 = call i64 @"meta_grad_one"(i64 %t1939, i64 %t1940, i64 %t1941, i64 %t1942, i64 %t1943, i64 %t1944, i64 %t1945, i64 %t1946, i64 %t1947, i64 %t1948, i64 %t1949, i64 %t1950, i64 %t1951, i64 %t1952, i64 %t1953, i64 %t1954, i64 8, i64 %t1955)
  store i64 %t1956, ptr %local.mg.1624
  %t1957 = load i64, ptr %local.a23.1620
  %t1958 = load i64, ptr %local.meta_lr.1627
  %t1959 = load i64, ptr %local.mg.1624
  %t1960 = call i64 @"sx_f64_mul"(i64 %t1958, i64 %t1959)
  %t1961 = call i64 @"sx_f64_sub"(i64 %t1957, i64 %t1960)
  %t1962 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.225)
  %t1963 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.226)
  %t1964 = call i64 @"clamp"(i64 %t1961, i64 %t1962, i64 %t1963)
  store i64 %t1964, ptr %local.a23.1620
  %t1965 = load i64, ptr %local.a01.1612
  %t1966 = load i64, ptr %local.a02.1613
  %t1967 = load i64, ptr %local.a03.1614
  %t1968 = load i64, ptr %local.a10.1615
  %t1969 = load i64, ptr %local.a12.1616
  %t1970 = load i64, ptr %local.a13.1617
  %t1971 = load i64, ptr %local.a20.1618
  %t1972 = load i64, ptr %local.a21.1619
  %t1973 = load i64, ptr %local.a23.1620
  %t1974 = load i64, ptr %local.a30.1621
  %t1975 = load i64, ptr %local.a31.1622
  %t1976 = load i64, ptr %local.a32.1623
  %t1977 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.227)
  %t1978 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.228)
  %t1979 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.229)
  %t1980 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.230)
  %t1981 = load i64, ptr %local.inner_steps.1628
  %t1982 = call i64 @"meta_grad_one"(i64 %t1965, i64 %t1966, i64 %t1967, i64 %t1968, i64 %t1969, i64 %t1970, i64 %t1971, i64 %t1972, i64 %t1973, i64 %t1974, i64 %t1975, i64 %t1976, i64 %t1977, i64 %t1978, i64 %t1979, i64 %t1980, i64 9, i64 %t1981)
  store i64 %t1982, ptr %local.mg.1624
  %t1983 = load i64, ptr %local.a30.1621
  %t1984 = load i64, ptr %local.meta_lr.1627
  %t1985 = load i64, ptr %local.mg.1624
  %t1986 = call i64 @"sx_f64_mul"(i64 %t1984, i64 %t1985)
  %t1987 = call i64 @"sx_f64_sub"(i64 %t1983, i64 %t1986)
  %t1988 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.231)
  %t1989 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.232)
  %t1990 = call i64 @"clamp"(i64 %t1987, i64 %t1988, i64 %t1989)
  store i64 %t1990, ptr %local.a30.1621
  %t1991 = load i64, ptr %local.a01.1612
  %t1992 = load i64, ptr %local.a02.1613
  %t1993 = load i64, ptr %local.a03.1614
  %t1994 = load i64, ptr %local.a10.1615
  %t1995 = load i64, ptr %local.a12.1616
  %t1996 = load i64, ptr %local.a13.1617
  %t1997 = load i64, ptr %local.a20.1618
  %t1998 = load i64, ptr %local.a21.1619
  %t1999 = load i64, ptr %local.a23.1620
  %t2000 = load i64, ptr %local.a30.1621
  %t2001 = load i64, ptr %local.a31.1622
  %t2002 = load i64, ptr %local.a32.1623
  %t2003 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.233)
  %t2004 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.234)
  %t2005 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.235)
  %t2006 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.236)
  %t2007 = load i64, ptr %local.inner_steps.1628
  %t2008 = call i64 @"meta_grad_one"(i64 %t1991, i64 %t1992, i64 %t1993, i64 %t1994, i64 %t1995, i64 %t1996, i64 %t1997, i64 %t1998, i64 %t1999, i64 %t2000, i64 %t2001, i64 %t2002, i64 %t2003, i64 %t2004, i64 %t2005, i64 %t2006, i64 10, i64 %t2007)
  store i64 %t2008, ptr %local.mg.1624
  %t2009 = load i64, ptr %local.a31.1622
  %t2010 = load i64, ptr %local.meta_lr.1627
  %t2011 = load i64, ptr %local.mg.1624
  %t2012 = call i64 @"sx_f64_mul"(i64 %t2010, i64 %t2011)
  %t2013 = call i64 @"sx_f64_sub"(i64 %t2009, i64 %t2012)
  %t2014 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.237)
  %t2015 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.238)
  %t2016 = call i64 @"clamp"(i64 %t2013, i64 %t2014, i64 %t2015)
  store i64 %t2016, ptr %local.a31.1622
  %t2017 = load i64, ptr %local.a01.1612
  %t2018 = load i64, ptr %local.a02.1613
  %t2019 = load i64, ptr %local.a03.1614
  %t2020 = load i64, ptr %local.a10.1615
  %t2021 = load i64, ptr %local.a12.1616
  %t2022 = load i64, ptr %local.a13.1617
  %t2023 = load i64, ptr %local.a20.1618
  %t2024 = load i64, ptr %local.a21.1619
  %t2025 = load i64, ptr %local.a23.1620
  %t2026 = load i64, ptr %local.a30.1621
  %t2027 = load i64, ptr %local.a31.1622
  %t2028 = load i64, ptr %local.a32.1623
  %t2029 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.239)
  %t2030 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.240)
  %t2031 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.241)
  %t2032 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.242)
  %t2033 = load i64, ptr %local.inner_steps.1628
  %t2034 = call i64 @"meta_grad_one"(i64 %t2017, i64 %t2018, i64 %t2019, i64 %t2020, i64 %t2021, i64 %t2022, i64 %t2023, i64 %t2024, i64 %t2025, i64 %t2026, i64 %t2027, i64 %t2028, i64 %t2029, i64 %t2030, i64 %t2031, i64 %t2032, i64 11, i64 %t2033)
  store i64 %t2034, ptr %local.mg.1624
  %t2035 = load i64, ptr %local.a32.1623
  %t2036 = load i64, ptr %local.meta_lr.1627
  %t2037 = load i64, ptr %local.mg.1624
  %t2038 = call i64 @"sx_f64_mul"(i64 %t2036, i64 %t2037)
  %t2039 = call i64 @"sx_f64_sub"(i64 %t2035, i64 %t2038)
  %t2040 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.243)
  %t2041 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.244)
  %t2042 = call i64 @"clamp"(i64 %t2039, i64 %t2040, i64 %t2041)
  store i64 %t2042, ptr %local.a32.1623
  %t2043 = load i64, ptr %local.a01.1612
  %t2044 = load i64, ptr %local.a02.1613
  %t2045 = load i64, ptr %local.a03.1614
  %t2046 = load i64, ptr %local.a10.1615
  %t2047 = load i64, ptr %local.a12.1616
  %t2048 = load i64, ptr %local.a13.1617
  %t2049 = load i64, ptr %local.a20.1618
  %t2050 = load i64, ptr %local.a21.1619
  %t2051 = load i64, ptr %local.a23.1620
  %t2052 = load i64, ptr %local.a30.1621
  %t2053 = load i64, ptr %local.a31.1622
  %t2054 = load i64, ptr %local.a32.1623
  %t2055 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.245)
  %t2056 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.246)
  %t2057 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.247)
  %t2058 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.248)
  %t2059 = load i64, ptr %local.inner_steps.1628
  %t2060 = call i64 @"run_inner"(i64 %t2043, i64 %t2044, i64 %t2045, i64 %t2046, i64 %t2047, i64 %t2048, i64 %t2049, i64 %t2050, i64 %t2051, i64 %t2052, i64 %t2053, i64 %t2054, i64 %t2055, i64 %t2056, i64 %t2057, i64 %t2058, i64 %t2059)
  store i64 %t2060, ptr %local.loss.1626
  %t2061 = load i64, ptr %local.cycle.1625
  %t2062 = icmp eq i64 %t2061, 0
  %t2063 = zext i1 %t2062 to i64
  %t2064 = icmp ne i64 %t2063, 0
  br i1 %t2064, label %then59, label %else59
then59:
  %t2065 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.249)
  %t2066 = ptrtoint ptr %t2065 to i64
  %t2067 = inttoptr i64 %t2066 to ptr
  call void @intrinsic_print(ptr %t2067)
  %t2068 = load i64, ptr %local.loss.1626
  %t2069 = call i64 @"print_f64"(i64 %t2068)
  %t2070 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.250)
  %t2071 = ptrtoint ptr %t2070 to i64
  %t2072 = inttoptr i64 %t2071 to ptr
  call void @intrinsic_println(ptr %t2072)
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t2073 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t2074 = load i64, ptr %local.cycle.1625
  %t2075 = icmp eq i64 %t2074, 9
  %t2076 = zext i1 %t2075 to i64
  %t2077 = icmp ne i64 %t2076, 0
  br i1 %t2077, label %then60, label %else60
then60:
  %t2078 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.251)
  %t2079 = ptrtoint ptr %t2078 to i64
  %t2080 = inttoptr i64 %t2079 to ptr
  call void @intrinsic_print(ptr %t2080)
  %t2081 = load i64, ptr %local.loss.1626
  %t2082 = call i64 @"print_f64"(i64 %t2081)
  %t2083 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.252)
  %t2084 = ptrtoint ptr %t2083 to i64
  %t2085 = inttoptr i64 %t2084 to ptr
  call void @intrinsic_println(ptr %t2085)
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t2086 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t2087 = load i64, ptr %local.cycle.1625
  %t2088 = icmp eq i64 %t2087, 24
  %t2089 = zext i1 %t2088 to i64
  %t2090 = icmp ne i64 %t2089, 0
  br i1 %t2090, label %then61, label %else61
then61:
  %t2091 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.253)
  %t2092 = ptrtoint ptr %t2091 to i64
  %t2093 = inttoptr i64 %t2092 to ptr
  call void @intrinsic_print(ptr %t2093)
  %t2094 = load i64, ptr %local.loss.1626
  %t2095 = call i64 @"print_f64"(i64 %t2094)
  %t2096 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.254)
  %t2097 = ptrtoint ptr %t2096 to i64
  %t2098 = inttoptr i64 %t2097 to ptr
  call void @intrinsic_println(ptr %t2098)
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t2099 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t2100 = load i64, ptr %local.cycle.1625
  %t2101 = icmp eq i64 %t2100, 49
  %t2102 = zext i1 %t2101 to i64
  %t2103 = icmp ne i64 %t2102, 0
  br i1 %t2103, label %then62, label %else62
then62:
  %t2104 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.255)
  %t2105 = ptrtoint ptr %t2104 to i64
  %t2106 = inttoptr i64 %t2105 to ptr
  call void @intrinsic_print(ptr %t2106)
  %t2107 = load i64, ptr %local.loss.1626
  %t2108 = call i64 @"print_f64"(i64 %t2107)
  %t2109 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.256)
  %t2110 = ptrtoint ptr %t2109 to i64
  %t2111 = inttoptr i64 %t2110 to ptr
  call void @intrinsic_println(ptr %t2111)
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t2112 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  %t2113 = load i64, ptr %local.cycle.1625
  %t2114 = add i64 %t2113, 1
  store i64 %t2114, ptr %local.cycle.1625
  br label %loop58
endloop58:
  %t2115 = load i64, ptr %local.a01.1612
  %t2116 = load i64, ptr %local.a02.1613
  %t2117 = load i64, ptr %local.a03.1614
  %t2118 = load i64, ptr %local.a10.1615
  %t2119 = load i64, ptr %local.a12.1616
  %t2120 = load i64, ptr %local.a13.1617
  %t2121 = load i64, ptr %local.a20.1618
  %t2122 = load i64, ptr %local.a21.1619
  %t2123 = load i64, ptr %local.a23.1620
  %t2124 = load i64, ptr %local.a30.1621
  %t2125 = load i64, ptr %local.a31.1622
  %t2126 = load i64, ptr %local.a32.1623
  %t2127 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.257)
  %t2128 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.258)
  %t2129 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.259)
  %t2130 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.260)
  %t2131 = load i64, ptr %local.inner_steps.1628
  %t2132 = call i64 @"run_inner"(i64 %t2115, i64 %t2116, i64 %t2117, i64 %t2118, i64 %t2119, i64 %t2120, i64 %t2121, i64 %t2122, i64 %t2123, i64 %t2124, i64 %t2125, i64 %t2126, i64 %t2127, i64 %t2128, i64 %t2129, i64 %t2130, i64 %t2131)
  store i64 %t2132, ptr %local.final_loss.1632
  %t2133 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.261)
  %t2134 = ptrtoint ptr %t2133 to i64
  %t2135 = inttoptr i64 %t2134 to ptr
  call void @intrinsic_println(ptr %t2135)
  %t2136 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.262)
  %t2137 = ptrtoint ptr %t2136 to i64
  %t2138 = inttoptr i64 %t2137 to ptr
  call void @intrinsic_println(ptr %t2138)
  %t2139 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.263)
  %t2140 = ptrtoint ptr %t2139 to i64
  %t2141 = inttoptr i64 %t2140 to ptr
  call void @intrinsic_println(ptr %t2141)
  %t2142 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.264)
  %t2143 = ptrtoint ptr %t2142 to i64
  %t2144 = inttoptr i64 %t2143 to ptr
  call void @intrinsic_println(ptr %t2144)
  %t2145 = load i64, ptr %local.a01.1612
  %t2146 = load i64, ptr %local.a02.1613
  %t2147 = load i64, ptr %local.a03.1614
  %t2148 = load i64, ptr %local.a10.1615
  %t2149 = load i64, ptr %local.a12.1616
  %t2150 = load i64, ptr %local.a13.1617
  %t2151 = load i64, ptr %local.a20.1618
  %t2152 = load i64, ptr %local.a21.1619
  %t2153 = load i64, ptr %local.a23.1620
  %t2154 = load i64, ptr %local.a30.1621
  %t2155 = load i64, ptr %local.a31.1622
  %t2156 = load i64, ptr %local.a32.1623
  %t2157 = call i64 @"print_matrix_4x4"(i64 %t2145, i64 %t2146, i64 %t2147, i64 %t2148, i64 %t2149, i64 %t2150, i64 %t2151, i64 %t2152, i64 %t2153, i64 %t2154, i64 %t2155, i64 %t2156)
  store i64 %t2157, ptr %local.dummy.1633
  %t2158 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.265)
  %t2159 = ptrtoint ptr %t2158 to i64
  %t2160 = inttoptr i64 %t2159 to ptr
  call void @intrinsic_println(ptr %t2160)
  %t2161 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.266)
  %t2162 = ptrtoint ptr %t2161 to i64
  %t2163 = inttoptr i64 %t2162 to ptr
  call void @intrinsic_println(ptr %t2163)
  %t2164 = load i64, ptr %local.a20.1618
  %t2165 = load i64, ptr %local.a21.1619
  %t2166 = call i64 @"sx_f64_add"(i64 %t2164, i64 %t2165)
  %t2167 = load i64, ptr %local.a23.1620
  %t2168 = call i64 @"sx_f64_add"(i64 %t2166, i64 %t2167)
  %t2169 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.267)
  %t2170 = call i64 @"sx_f64_div"(i64 %t2168, i64 %t2169)
  store i64 %t2170, ptr %local.avg_cf_out.1634
  %t2171 = load i64, ptr %local.a02.1613
  %t2172 = load i64, ptr %local.a12.1616
  %t2173 = call i64 @"sx_f64_add"(i64 %t2171, i64 %t2172)
  %t2174 = load i64, ptr %local.a32.1623
  %t2175 = call i64 @"sx_f64_add"(i64 %t2173, i64 %t2174)
  %t2176 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.268)
  %t2177 = call i64 @"sx_f64_div"(i64 %t2175, i64 %t2176)
  store i64 %t2177, ptr %local.avg_cf_in.1635
  %t2178 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.269)
  %t2179 = ptrtoint ptr %t2178 to i64
  %t2180 = inttoptr i64 %t2179 to ptr
  call void @intrinsic_print(ptr %t2180)
  %t2181 = load i64, ptr %local.avg_cf_out.1634
  %t2182 = call i64 @"print_f64"(i64 %t2181)
  %t2183 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.270)
  %t2184 = ptrtoint ptr %t2183 to i64
  %t2185 = inttoptr i64 %t2184 to ptr
  call void @intrinsic_println(ptr %t2185)
  %t2186 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.271)
  %t2187 = ptrtoint ptr %t2186 to i64
  %t2188 = inttoptr i64 %t2187 to ptr
  call void @intrinsic_print(ptr %t2188)
  %t2189 = load i64, ptr %local.avg_cf_in.1635
  %t2190 = call i64 @"print_f64"(i64 %t2189)
  %t2191 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.272)
  %t2192 = ptrtoint ptr %t2191 to i64
  %t2193 = inttoptr i64 %t2192 to ptr
  call void @intrinsic_println(ptr %t2193)
  %t2194 = load i64, ptr %local.a01.1612
  %t2195 = load i64, ptr %local.a10.1615
  %t2196 = call i64 @"sx_f64_add"(i64 %t2194, i64 %t2195)
  %t2197 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.273)
  %t2198 = call i64 @"sx_f64_div"(i64 %t2196, i64 %t2197)
  store i64 %t2198, ptr %local.inline_unroll.1636
  %t2199 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.274)
  %t2200 = ptrtoint ptr %t2199 to i64
  %t2201 = inttoptr i64 %t2200 to ptr
  call void @intrinsic_print(ptr %t2201)
  %t2202 = load i64, ptr %local.inline_unroll.1636
  %t2203 = call i64 @"print_f64"(i64 %t2202)
  %t2204 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.275)
  %t2205 = ptrtoint ptr %t2204 to i64
  %t2206 = inttoptr i64 %t2205 to ptr
  call void @intrinsic_println(ptr %t2206)
  %t2207 = load i64, ptr %local.a03.1614
  %t2208 = load i64, ptr %local.a30.1621
  %t2209 = call i64 @"sx_f64_add"(i64 %t2207, i64 %t2208)
  %t2210 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.276)
  %t2211 = call i64 @"sx_f64_div"(i64 %t2209, i64 %t2210)
  store i64 %t2211, ptr %local.inline_simd.1637
  %t2212 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.277)
  %t2213 = ptrtoint ptr %t2212 to i64
  %t2214 = inttoptr i64 %t2213 to ptr
  call void @intrinsic_print(ptr %t2214)
  %t2215 = load i64, ptr %local.inline_simd.1637
  %t2216 = call i64 @"print_f64"(i64 %t2215)
  %t2217 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.278)
  %t2218 = ptrtoint ptr %t2217 to i64
  %t2219 = inttoptr i64 %t2218 to ptr
  call void @intrinsic_println(ptr %t2219)
  %t2220 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.279)
  %t2221 = ptrtoint ptr %t2220 to i64
  %t2222 = inttoptr i64 %t2221 to ptr
  call void @intrinsic_println(ptr %t2222)
  %t2223 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.280)
  %t2224 = ptrtoint ptr %t2223 to i64
  %t2225 = inttoptr i64 %t2224 to ptr
  call void @intrinsic_print(ptr %t2225)
  %t2226 = load i64, ptr %local.final_loss.1632
  %t2227 = call i64 @"print_f64"(i64 %t2226)
  %t2228 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.281)
  %t2229 = ptrtoint ptr %t2228 to i64
  %t2230 = inttoptr i64 %t2229 to ptr
  call void @intrinsic_println(ptr %t2230)
  %t2231 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.282)
  %t2232 = ptrtoint ptr %t2231 to i64
  %t2233 = inttoptr i64 %t2232 to ptr
  call void @intrinsic_print(ptr %t2233)
  %t2234 = load i64, ptr %local.loss_none.1630
  %t2235 = call i64 @"print_f64"(i64 %t2234)
  %t2236 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.283)
  %t2237 = ptrtoint ptr %t2236 to i64
  %t2238 = inttoptr i64 %t2237 to ptr
  call void @intrinsic_println(ptr %t2238)
  %t2239 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.284)
  %t2240 = ptrtoint ptr %t2239 to i64
  %t2241 = inttoptr i64 %t2240 to ptr
  call void @intrinsic_print(ptr %t2241)
  %t2242 = load i64, ptr %local.loss_uniform.1631
  %t2243 = call i64 @"print_f64"(i64 %t2242)
  %t2244 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.285)
  %t2245 = ptrtoint ptr %t2244 to i64
  %t2246 = inttoptr i64 %t2245 to ptr
  call void @intrinsic_println(ptr %t2246)
  %t2247 = load i64, ptr %local.final_loss.1632
  %t2248 = load i64, ptr %local.loss_none.1630
  %t2249 = call i64 @"sx_f64_lt"(i64 %t2247, i64 %t2248)
  %t2250 = icmp ne i64 %t2249, 0
  br i1 %t2250, label %then63, label %else63
then63:
  %t2251 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.286)
  %t2252 = ptrtoint ptr %t2251 to i64
  %t2253 = inttoptr i64 %t2252 to ptr
  call void @intrinsic_println(ptr %t2253)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  %t2254 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.287)
  %t2255 = ptrtoint ptr %t2254 to i64
  %t2256 = inttoptr i64 %t2255 to ptr
  call void @intrinsic_println(ptr %t2256)
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t2257 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t2258 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.288)
  %t2259 = ptrtoint ptr %t2258 to i64
  %t2260 = inttoptr i64 %t2259 to ptr
  call void @intrinsic_println(ptr %t2260)
  ret i64 0
}

define i64 @"run_program_training"(i64 %b0, i64 %b1, i64 %b2, i64 %b3, i64 %label) nounwind {
entry:
  %local.a01.2261 = alloca i64
  %local.a02.2262 = alloca i64
  %local.a03.2263 = alloca i64
  %local.a10.2264 = alloca i64
  %local.a12.2265 = alloca i64
  %local.a13.2266 = alloca i64
  %local.a20.2267 = alloca i64
  %local.a21.2268 = alloca i64
  %local.a23.2269 = alloca i64
  %local.a30.2270 = alloca i64
  %local.a31.2271 = alloca i64
  %local.a32.2272 = alloca i64
  %local.mg.2273 = alloca i64
  %local.cycle.2274 = alloca i64
  %local.loss.2275 = alloca i64
  %local.max_val.2276 = alloca i64
  %local.min_val.2277 = alloca i64
  %local.meta_lr.2278 = alloca i64
  %local.inner_steps.2279 = alloca i64
  %local.meta_cycles.2280 = alloca i64
  %local.dummy.2281 = alloca i64
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %local.label = alloca i64
  store i64 %label, ptr %local.label
  %t2282 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.289)
  store i64 %t2282, ptr %local.a01.2261
  %t2283 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.290)
  store i64 %t2283, ptr %local.a02.2262
  %t2284 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.291)
  store i64 %t2284, ptr %local.a03.2263
  %t2285 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.292)
  store i64 %t2285, ptr %local.a10.2264
  %t2286 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.293)
  store i64 %t2286, ptr %local.a12.2265
  %t2287 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.294)
  store i64 %t2287, ptr %local.a13.2266
  %t2288 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.295)
  store i64 %t2288, ptr %local.a20.2267
  %t2289 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.296)
  store i64 %t2289, ptr %local.a21.2268
  %t2290 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.297)
  store i64 %t2290, ptr %local.a23.2269
  %t2291 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.298)
  store i64 %t2291, ptr %local.a30.2270
  %t2292 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.299)
  store i64 %t2292, ptr %local.a31.2271
  %t2293 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.300)
  store i64 %t2293, ptr %local.a32.2272
  %t2294 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.301)
  store i64 %t2294, ptr %local.mg.2273
  store i64 0, ptr %local.cycle.2274
  %t2295 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.302)
  store i64 %t2295, ptr %local.loss.2275
  %t2296 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.303)
  store i64 %t2296, ptr %local.max_val.2276
  %t2297 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.304)
  store i64 %t2297, ptr %local.min_val.2277
  %t2298 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.305)
  store i64 %t2298, ptr %local.meta_lr.2278
  store i64 200, ptr %local.inner_steps.2279
  store i64 50, ptr %local.meta_cycles.2280
  %t2299 = load i64, ptr %local.label
  %t2300 = icmp eq i64 %t2299, 0
  %t2301 = zext i1 %t2300 to i64
  %t2302 = icmp ne i64 %t2301, 0
  br i1 %t2302, label %then64, label %else64
then64:
  %t2303 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.306)
  %t2304 = ptrtoint ptr %t2303 to i64
  %t2305 = inttoptr i64 %t2304 to ptr
  call void @intrinsic_println(ptr %t2305)
  br label %then64_end
then64_end:
  br label %endif64
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t2306 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t2307 = load i64, ptr %local.label
  %t2308 = icmp eq i64 %t2307, 1
  %t2309 = zext i1 %t2308 to i64
  %t2310 = icmp ne i64 %t2309, 0
  br i1 %t2310, label %then65, label %else65
then65:
  %t2311 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.307)
  %t2312 = ptrtoint ptr %t2311 to i64
  %t2313 = inttoptr i64 %t2312 to ptr
  call void @intrinsic_println(ptr %t2313)
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t2314 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  %t2315 = load i64, ptr %local.label
  %t2316 = icmp eq i64 %t2315, 2
  %t2317 = zext i1 %t2316 to i64
  %t2318 = icmp ne i64 %t2317, 0
  br i1 %t2318, label %then66, label %else66
then66:
  %t2319 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.308)
  %t2320 = ptrtoint ptr %t2319 to i64
  %t2321 = inttoptr i64 %t2320 to ptr
  call void @intrinsic_println(ptr %t2321)
  br label %then66_end
then66_end:
  br label %endif66
else66:
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t2322 = phi i64 [ 0, %then66_end ], [ 0, %else66_end ]
  br label %loop67
loop67:
  %t2323 = load i64, ptr %local.cycle.2274
  %t2324 = load i64, ptr %local.meta_cycles.2280
  %t2325 = icmp slt i64 %t2323, %t2324
  %t2326 = zext i1 %t2325 to i64
  %t2327 = icmp ne i64 %t2326, 0
  br i1 %t2327, label %body67, label %endloop67
body67:
  %t2328 = load i64, ptr %local.a01.2261
  %t2329 = load i64, ptr %local.a02.2262
  %t2330 = load i64, ptr %local.a03.2263
  %t2331 = load i64, ptr %local.a10.2264
  %t2332 = load i64, ptr %local.a12.2265
  %t2333 = load i64, ptr %local.a13.2266
  %t2334 = load i64, ptr %local.a20.2267
  %t2335 = load i64, ptr %local.a21.2268
  %t2336 = load i64, ptr %local.a23.2269
  %t2337 = load i64, ptr %local.a30.2270
  %t2338 = load i64, ptr %local.a31.2271
  %t2339 = load i64, ptr %local.a32.2272
  %t2340 = load i64, ptr %local.b0
  %t2341 = load i64, ptr %local.b1
  %t2342 = load i64, ptr %local.b2
  %t2343 = load i64, ptr %local.b3
  %t2344 = load i64, ptr %local.inner_steps.2279
  %t2345 = call i64 @"meta_grad_one"(i64 %t2328, i64 %t2329, i64 %t2330, i64 %t2331, i64 %t2332, i64 %t2333, i64 %t2334, i64 %t2335, i64 %t2336, i64 %t2337, i64 %t2338, i64 %t2339, i64 %t2340, i64 %t2341, i64 %t2342, i64 %t2343, i64 0, i64 %t2344)
  store i64 %t2345, ptr %local.mg.2273
  %t2346 = load i64, ptr %local.a01.2261
  %t2347 = load i64, ptr %local.meta_lr.2278
  %t2348 = load i64, ptr %local.mg.2273
  %t2349 = call i64 @"sx_f64_mul"(i64 %t2347, i64 %t2348)
  %t2350 = call i64 @"sx_f64_sub"(i64 %t2346, i64 %t2349)
  %t2351 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.309)
  %t2352 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.310)
  %t2353 = call i64 @"clamp"(i64 %t2350, i64 %t2351, i64 %t2352)
  store i64 %t2353, ptr %local.a01.2261
  %t2354 = load i64, ptr %local.a01.2261
  %t2355 = load i64, ptr %local.a02.2262
  %t2356 = load i64, ptr %local.a03.2263
  %t2357 = load i64, ptr %local.a10.2264
  %t2358 = load i64, ptr %local.a12.2265
  %t2359 = load i64, ptr %local.a13.2266
  %t2360 = load i64, ptr %local.a20.2267
  %t2361 = load i64, ptr %local.a21.2268
  %t2362 = load i64, ptr %local.a23.2269
  %t2363 = load i64, ptr %local.a30.2270
  %t2364 = load i64, ptr %local.a31.2271
  %t2365 = load i64, ptr %local.a32.2272
  %t2366 = load i64, ptr %local.b0
  %t2367 = load i64, ptr %local.b1
  %t2368 = load i64, ptr %local.b2
  %t2369 = load i64, ptr %local.b3
  %t2370 = load i64, ptr %local.inner_steps.2279
  %t2371 = call i64 @"meta_grad_one"(i64 %t2354, i64 %t2355, i64 %t2356, i64 %t2357, i64 %t2358, i64 %t2359, i64 %t2360, i64 %t2361, i64 %t2362, i64 %t2363, i64 %t2364, i64 %t2365, i64 %t2366, i64 %t2367, i64 %t2368, i64 %t2369, i64 1, i64 %t2370)
  store i64 %t2371, ptr %local.mg.2273
  %t2372 = load i64, ptr %local.a02.2262
  %t2373 = load i64, ptr %local.meta_lr.2278
  %t2374 = load i64, ptr %local.mg.2273
  %t2375 = call i64 @"sx_f64_mul"(i64 %t2373, i64 %t2374)
  %t2376 = call i64 @"sx_f64_sub"(i64 %t2372, i64 %t2375)
  %t2377 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.311)
  %t2378 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.312)
  %t2379 = call i64 @"clamp"(i64 %t2376, i64 %t2377, i64 %t2378)
  store i64 %t2379, ptr %local.a02.2262
  %t2380 = load i64, ptr %local.a01.2261
  %t2381 = load i64, ptr %local.a02.2262
  %t2382 = load i64, ptr %local.a03.2263
  %t2383 = load i64, ptr %local.a10.2264
  %t2384 = load i64, ptr %local.a12.2265
  %t2385 = load i64, ptr %local.a13.2266
  %t2386 = load i64, ptr %local.a20.2267
  %t2387 = load i64, ptr %local.a21.2268
  %t2388 = load i64, ptr %local.a23.2269
  %t2389 = load i64, ptr %local.a30.2270
  %t2390 = load i64, ptr %local.a31.2271
  %t2391 = load i64, ptr %local.a32.2272
  %t2392 = load i64, ptr %local.b0
  %t2393 = load i64, ptr %local.b1
  %t2394 = load i64, ptr %local.b2
  %t2395 = load i64, ptr %local.b3
  %t2396 = load i64, ptr %local.inner_steps.2279
  %t2397 = call i64 @"meta_grad_one"(i64 %t2380, i64 %t2381, i64 %t2382, i64 %t2383, i64 %t2384, i64 %t2385, i64 %t2386, i64 %t2387, i64 %t2388, i64 %t2389, i64 %t2390, i64 %t2391, i64 %t2392, i64 %t2393, i64 %t2394, i64 %t2395, i64 2, i64 %t2396)
  store i64 %t2397, ptr %local.mg.2273
  %t2398 = load i64, ptr %local.a03.2263
  %t2399 = load i64, ptr %local.meta_lr.2278
  %t2400 = load i64, ptr %local.mg.2273
  %t2401 = call i64 @"sx_f64_mul"(i64 %t2399, i64 %t2400)
  %t2402 = call i64 @"sx_f64_sub"(i64 %t2398, i64 %t2401)
  %t2403 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.313)
  %t2404 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.314)
  %t2405 = call i64 @"clamp"(i64 %t2402, i64 %t2403, i64 %t2404)
  store i64 %t2405, ptr %local.a03.2263
  %t2406 = load i64, ptr %local.a01.2261
  %t2407 = load i64, ptr %local.a02.2262
  %t2408 = load i64, ptr %local.a03.2263
  %t2409 = load i64, ptr %local.a10.2264
  %t2410 = load i64, ptr %local.a12.2265
  %t2411 = load i64, ptr %local.a13.2266
  %t2412 = load i64, ptr %local.a20.2267
  %t2413 = load i64, ptr %local.a21.2268
  %t2414 = load i64, ptr %local.a23.2269
  %t2415 = load i64, ptr %local.a30.2270
  %t2416 = load i64, ptr %local.a31.2271
  %t2417 = load i64, ptr %local.a32.2272
  %t2418 = load i64, ptr %local.b0
  %t2419 = load i64, ptr %local.b1
  %t2420 = load i64, ptr %local.b2
  %t2421 = load i64, ptr %local.b3
  %t2422 = load i64, ptr %local.inner_steps.2279
  %t2423 = call i64 @"meta_grad_one"(i64 %t2406, i64 %t2407, i64 %t2408, i64 %t2409, i64 %t2410, i64 %t2411, i64 %t2412, i64 %t2413, i64 %t2414, i64 %t2415, i64 %t2416, i64 %t2417, i64 %t2418, i64 %t2419, i64 %t2420, i64 %t2421, i64 3, i64 %t2422)
  store i64 %t2423, ptr %local.mg.2273
  %t2424 = load i64, ptr %local.a10.2264
  %t2425 = load i64, ptr %local.meta_lr.2278
  %t2426 = load i64, ptr %local.mg.2273
  %t2427 = call i64 @"sx_f64_mul"(i64 %t2425, i64 %t2426)
  %t2428 = call i64 @"sx_f64_sub"(i64 %t2424, i64 %t2427)
  %t2429 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.315)
  %t2430 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.316)
  %t2431 = call i64 @"clamp"(i64 %t2428, i64 %t2429, i64 %t2430)
  store i64 %t2431, ptr %local.a10.2264
  %t2432 = load i64, ptr %local.a01.2261
  %t2433 = load i64, ptr %local.a02.2262
  %t2434 = load i64, ptr %local.a03.2263
  %t2435 = load i64, ptr %local.a10.2264
  %t2436 = load i64, ptr %local.a12.2265
  %t2437 = load i64, ptr %local.a13.2266
  %t2438 = load i64, ptr %local.a20.2267
  %t2439 = load i64, ptr %local.a21.2268
  %t2440 = load i64, ptr %local.a23.2269
  %t2441 = load i64, ptr %local.a30.2270
  %t2442 = load i64, ptr %local.a31.2271
  %t2443 = load i64, ptr %local.a32.2272
  %t2444 = load i64, ptr %local.b0
  %t2445 = load i64, ptr %local.b1
  %t2446 = load i64, ptr %local.b2
  %t2447 = load i64, ptr %local.b3
  %t2448 = load i64, ptr %local.inner_steps.2279
  %t2449 = call i64 @"meta_grad_one"(i64 %t2432, i64 %t2433, i64 %t2434, i64 %t2435, i64 %t2436, i64 %t2437, i64 %t2438, i64 %t2439, i64 %t2440, i64 %t2441, i64 %t2442, i64 %t2443, i64 %t2444, i64 %t2445, i64 %t2446, i64 %t2447, i64 4, i64 %t2448)
  store i64 %t2449, ptr %local.mg.2273
  %t2450 = load i64, ptr %local.a12.2265
  %t2451 = load i64, ptr %local.meta_lr.2278
  %t2452 = load i64, ptr %local.mg.2273
  %t2453 = call i64 @"sx_f64_mul"(i64 %t2451, i64 %t2452)
  %t2454 = call i64 @"sx_f64_sub"(i64 %t2450, i64 %t2453)
  %t2455 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.317)
  %t2456 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.318)
  %t2457 = call i64 @"clamp"(i64 %t2454, i64 %t2455, i64 %t2456)
  store i64 %t2457, ptr %local.a12.2265
  %t2458 = load i64, ptr %local.a01.2261
  %t2459 = load i64, ptr %local.a02.2262
  %t2460 = load i64, ptr %local.a03.2263
  %t2461 = load i64, ptr %local.a10.2264
  %t2462 = load i64, ptr %local.a12.2265
  %t2463 = load i64, ptr %local.a13.2266
  %t2464 = load i64, ptr %local.a20.2267
  %t2465 = load i64, ptr %local.a21.2268
  %t2466 = load i64, ptr %local.a23.2269
  %t2467 = load i64, ptr %local.a30.2270
  %t2468 = load i64, ptr %local.a31.2271
  %t2469 = load i64, ptr %local.a32.2272
  %t2470 = load i64, ptr %local.b0
  %t2471 = load i64, ptr %local.b1
  %t2472 = load i64, ptr %local.b2
  %t2473 = load i64, ptr %local.b3
  %t2474 = load i64, ptr %local.inner_steps.2279
  %t2475 = call i64 @"meta_grad_one"(i64 %t2458, i64 %t2459, i64 %t2460, i64 %t2461, i64 %t2462, i64 %t2463, i64 %t2464, i64 %t2465, i64 %t2466, i64 %t2467, i64 %t2468, i64 %t2469, i64 %t2470, i64 %t2471, i64 %t2472, i64 %t2473, i64 5, i64 %t2474)
  store i64 %t2475, ptr %local.mg.2273
  %t2476 = load i64, ptr %local.a13.2266
  %t2477 = load i64, ptr %local.meta_lr.2278
  %t2478 = load i64, ptr %local.mg.2273
  %t2479 = call i64 @"sx_f64_mul"(i64 %t2477, i64 %t2478)
  %t2480 = call i64 @"sx_f64_sub"(i64 %t2476, i64 %t2479)
  %t2481 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.319)
  %t2482 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.320)
  %t2483 = call i64 @"clamp"(i64 %t2480, i64 %t2481, i64 %t2482)
  store i64 %t2483, ptr %local.a13.2266
  %t2484 = load i64, ptr %local.a01.2261
  %t2485 = load i64, ptr %local.a02.2262
  %t2486 = load i64, ptr %local.a03.2263
  %t2487 = load i64, ptr %local.a10.2264
  %t2488 = load i64, ptr %local.a12.2265
  %t2489 = load i64, ptr %local.a13.2266
  %t2490 = load i64, ptr %local.a20.2267
  %t2491 = load i64, ptr %local.a21.2268
  %t2492 = load i64, ptr %local.a23.2269
  %t2493 = load i64, ptr %local.a30.2270
  %t2494 = load i64, ptr %local.a31.2271
  %t2495 = load i64, ptr %local.a32.2272
  %t2496 = load i64, ptr %local.b0
  %t2497 = load i64, ptr %local.b1
  %t2498 = load i64, ptr %local.b2
  %t2499 = load i64, ptr %local.b3
  %t2500 = load i64, ptr %local.inner_steps.2279
  %t2501 = call i64 @"meta_grad_one"(i64 %t2484, i64 %t2485, i64 %t2486, i64 %t2487, i64 %t2488, i64 %t2489, i64 %t2490, i64 %t2491, i64 %t2492, i64 %t2493, i64 %t2494, i64 %t2495, i64 %t2496, i64 %t2497, i64 %t2498, i64 %t2499, i64 6, i64 %t2500)
  store i64 %t2501, ptr %local.mg.2273
  %t2502 = load i64, ptr %local.a20.2267
  %t2503 = load i64, ptr %local.meta_lr.2278
  %t2504 = load i64, ptr %local.mg.2273
  %t2505 = call i64 @"sx_f64_mul"(i64 %t2503, i64 %t2504)
  %t2506 = call i64 @"sx_f64_sub"(i64 %t2502, i64 %t2505)
  %t2507 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.321)
  %t2508 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.322)
  %t2509 = call i64 @"clamp"(i64 %t2506, i64 %t2507, i64 %t2508)
  store i64 %t2509, ptr %local.a20.2267
  %t2510 = load i64, ptr %local.a01.2261
  %t2511 = load i64, ptr %local.a02.2262
  %t2512 = load i64, ptr %local.a03.2263
  %t2513 = load i64, ptr %local.a10.2264
  %t2514 = load i64, ptr %local.a12.2265
  %t2515 = load i64, ptr %local.a13.2266
  %t2516 = load i64, ptr %local.a20.2267
  %t2517 = load i64, ptr %local.a21.2268
  %t2518 = load i64, ptr %local.a23.2269
  %t2519 = load i64, ptr %local.a30.2270
  %t2520 = load i64, ptr %local.a31.2271
  %t2521 = load i64, ptr %local.a32.2272
  %t2522 = load i64, ptr %local.b0
  %t2523 = load i64, ptr %local.b1
  %t2524 = load i64, ptr %local.b2
  %t2525 = load i64, ptr %local.b3
  %t2526 = load i64, ptr %local.inner_steps.2279
  %t2527 = call i64 @"meta_grad_one"(i64 %t2510, i64 %t2511, i64 %t2512, i64 %t2513, i64 %t2514, i64 %t2515, i64 %t2516, i64 %t2517, i64 %t2518, i64 %t2519, i64 %t2520, i64 %t2521, i64 %t2522, i64 %t2523, i64 %t2524, i64 %t2525, i64 7, i64 %t2526)
  store i64 %t2527, ptr %local.mg.2273
  %t2528 = load i64, ptr %local.a21.2268
  %t2529 = load i64, ptr %local.meta_lr.2278
  %t2530 = load i64, ptr %local.mg.2273
  %t2531 = call i64 @"sx_f64_mul"(i64 %t2529, i64 %t2530)
  %t2532 = call i64 @"sx_f64_sub"(i64 %t2528, i64 %t2531)
  %t2533 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.323)
  %t2534 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.324)
  %t2535 = call i64 @"clamp"(i64 %t2532, i64 %t2533, i64 %t2534)
  store i64 %t2535, ptr %local.a21.2268
  %t2536 = load i64, ptr %local.a01.2261
  %t2537 = load i64, ptr %local.a02.2262
  %t2538 = load i64, ptr %local.a03.2263
  %t2539 = load i64, ptr %local.a10.2264
  %t2540 = load i64, ptr %local.a12.2265
  %t2541 = load i64, ptr %local.a13.2266
  %t2542 = load i64, ptr %local.a20.2267
  %t2543 = load i64, ptr %local.a21.2268
  %t2544 = load i64, ptr %local.a23.2269
  %t2545 = load i64, ptr %local.a30.2270
  %t2546 = load i64, ptr %local.a31.2271
  %t2547 = load i64, ptr %local.a32.2272
  %t2548 = load i64, ptr %local.b0
  %t2549 = load i64, ptr %local.b1
  %t2550 = load i64, ptr %local.b2
  %t2551 = load i64, ptr %local.b3
  %t2552 = load i64, ptr %local.inner_steps.2279
  %t2553 = call i64 @"meta_grad_one"(i64 %t2536, i64 %t2537, i64 %t2538, i64 %t2539, i64 %t2540, i64 %t2541, i64 %t2542, i64 %t2543, i64 %t2544, i64 %t2545, i64 %t2546, i64 %t2547, i64 %t2548, i64 %t2549, i64 %t2550, i64 %t2551, i64 8, i64 %t2552)
  store i64 %t2553, ptr %local.mg.2273
  %t2554 = load i64, ptr %local.a23.2269
  %t2555 = load i64, ptr %local.meta_lr.2278
  %t2556 = load i64, ptr %local.mg.2273
  %t2557 = call i64 @"sx_f64_mul"(i64 %t2555, i64 %t2556)
  %t2558 = call i64 @"sx_f64_sub"(i64 %t2554, i64 %t2557)
  %t2559 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.325)
  %t2560 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.326)
  %t2561 = call i64 @"clamp"(i64 %t2558, i64 %t2559, i64 %t2560)
  store i64 %t2561, ptr %local.a23.2269
  %t2562 = load i64, ptr %local.a01.2261
  %t2563 = load i64, ptr %local.a02.2262
  %t2564 = load i64, ptr %local.a03.2263
  %t2565 = load i64, ptr %local.a10.2264
  %t2566 = load i64, ptr %local.a12.2265
  %t2567 = load i64, ptr %local.a13.2266
  %t2568 = load i64, ptr %local.a20.2267
  %t2569 = load i64, ptr %local.a21.2268
  %t2570 = load i64, ptr %local.a23.2269
  %t2571 = load i64, ptr %local.a30.2270
  %t2572 = load i64, ptr %local.a31.2271
  %t2573 = load i64, ptr %local.a32.2272
  %t2574 = load i64, ptr %local.b0
  %t2575 = load i64, ptr %local.b1
  %t2576 = load i64, ptr %local.b2
  %t2577 = load i64, ptr %local.b3
  %t2578 = load i64, ptr %local.inner_steps.2279
  %t2579 = call i64 @"meta_grad_one"(i64 %t2562, i64 %t2563, i64 %t2564, i64 %t2565, i64 %t2566, i64 %t2567, i64 %t2568, i64 %t2569, i64 %t2570, i64 %t2571, i64 %t2572, i64 %t2573, i64 %t2574, i64 %t2575, i64 %t2576, i64 %t2577, i64 9, i64 %t2578)
  store i64 %t2579, ptr %local.mg.2273
  %t2580 = load i64, ptr %local.a30.2270
  %t2581 = load i64, ptr %local.meta_lr.2278
  %t2582 = load i64, ptr %local.mg.2273
  %t2583 = call i64 @"sx_f64_mul"(i64 %t2581, i64 %t2582)
  %t2584 = call i64 @"sx_f64_sub"(i64 %t2580, i64 %t2583)
  %t2585 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.327)
  %t2586 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.328)
  %t2587 = call i64 @"clamp"(i64 %t2584, i64 %t2585, i64 %t2586)
  store i64 %t2587, ptr %local.a30.2270
  %t2588 = load i64, ptr %local.a01.2261
  %t2589 = load i64, ptr %local.a02.2262
  %t2590 = load i64, ptr %local.a03.2263
  %t2591 = load i64, ptr %local.a10.2264
  %t2592 = load i64, ptr %local.a12.2265
  %t2593 = load i64, ptr %local.a13.2266
  %t2594 = load i64, ptr %local.a20.2267
  %t2595 = load i64, ptr %local.a21.2268
  %t2596 = load i64, ptr %local.a23.2269
  %t2597 = load i64, ptr %local.a30.2270
  %t2598 = load i64, ptr %local.a31.2271
  %t2599 = load i64, ptr %local.a32.2272
  %t2600 = load i64, ptr %local.b0
  %t2601 = load i64, ptr %local.b1
  %t2602 = load i64, ptr %local.b2
  %t2603 = load i64, ptr %local.b3
  %t2604 = load i64, ptr %local.inner_steps.2279
  %t2605 = call i64 @"meta_grad_one"(i64 %t2588, i64 %t2589, i64 %t2590, i64 %t2591, i64 %t2592, i64 %t2593, i64 %t2594, i64 %t2595, i64 %t2596, i64 %t2597, i64 %t2598, i64 %t2599, i64 %t2600, i64 %t2601, i64 %t2602, i64 %t2603, i64 10, i64 %t2604)
  store i64 %t2605, ptr %local.mg.2273
  %t2606 = load i64, ptr %local.a31.2271
  %t2607 = load i64, ptr %local.meta_lr.2278
  %t2608 = load i64, ptr %local.mg.2273
  %t2609 = call i64 @"sx_f64_mul"(i64 %t2607, i64 %t2608)
  %t2610 = call i64 @"sx_f64_sub"(i64 %t2606, i64 %t2609)
  %t2611 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.329)
  %t2612 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.330)
  %t2613 = call i64 @"clamp"(i64 %t2610, i64 %t2611, i64 %t2612)
  store i64 %t2613, ptr %local.a31.2271
  %t2614 = load i64, ptr %local.a01.2261
  %t2615 = load i64, ptr %local.a02.2262
  %t2616 = load i64, ptr %local.a03.2263
  %t2617 = load i64, ptr %local.a10.2264
  %t2618 = load i64, ptr %local.a12.2265
  %t2619 = load i64, ptr %local.a13.2266
  %t2620 = load i64, ptr %local.a20.2267
  %t2621 = load i64, ptr %local.a21.2268
  %t2622 = load i64, ptr %local.a23.2269
  %t2623 = load i64, ptr %local.a30.2270
  %t2624 = load i64, ptr %local.a31.2271
  %t2625 = load i64, ptr %local.a32.2272
  %t2626 = load i64, ptr %local.b0
  %t2627 = load i64, ptr %local.b1
  %t2628 = load i64, ptr %local.b2
  %t2629 = load i64, ptr %local.b3
  %t2630 = load i64, ptr %local.inner_steps.2279
  %t2631 = call i64 @"meta_grad_one"(i64 %t2614, i64 %t2615, i64 %t2616, i64 %t2617, i64 %t2618, i64 %t2619, i64 %t2620, i64 %t2621, i64 %t2622, i64 %t2623, i64 %t2624, i64 %t2625, i64 %t2626, i64 %t2627, i64 %t2628, i64 %t2629, i64 11, i64 %t2630)
  store i64 %t2631, ptr %local.mg.2273
  %t2632 = load i64, ptr %local.a32.2272
  %t2633 = load i64, ptr %local.meta_lr.2278
  %t2634 = load i64, ptr %local.mg.2273
  %t2635 = call i64 @"sx_f64_mul"(i64 %t2633, i64 %t2634)
  %t2636 = call i64 @"sx_f64_sub"(i64 %t2632, i64 %t2635)
  %t2637 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.331)
  %t2638 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.332)
  %t2639 = call i64 @"clamp"(i64 %t2636, i64 %t2637, i64 %t2638)
  store i64 %t2639, ptr %local.a32.2272
  %t2640 = load i64, ptr %local.cycle.2274
  %t2641 = add i64 %t2640, 1
  store i64 %t2641, ptr %local.cycle.2274
  br label %loop67
endloop67:
  %t2642 = load i64, ptr %local.a01.2261
  %t2643 = load i64, ptr %local.a02.2262
  %t2644 = load i64, ptr %local.a03.2263
  %t2645 = load i64, ptr %local.a10.2264
  %t2646 = load i64, ptr %local.a12.2265
  %t2647 = load i64, ptr %local.a13.2266
  %t2648 = load i64, ptr %local.a20.2267
  %t2649 = load i64, ptr %local.a21.2268
  %t2650 = load i64, ptr %local.a23.2269
  %t2651 = load i64, ptr %local.a30.2270
  %t2652 = load i64, ptr %local.a31.2271
  %t2653 = load i64, ptr %local.a32.2272
  %t2654 = load i64, ptr %local.b0
  %t2655 = load i64, ptr %local.b1
  %t2656 = load i64, ptr %local.b2
  %t2657 = load i64, ptr %local.b3
  %t2658 = load i64, ptr %local.inner_steps.2279
  %t2659 = call i64 @"run_inner"(i64 %t2642, i64 %t2643, i64 %t2644, i64 %t2645, i64 %t2646, i64 %t2647, i64 %t2648, i64 %t2649, i64 %t2650, i64 %t2651, i64 %t2652, i64 %t2653, i64 %t2654, i64 %t2655, i64 %t2656, i64 %t2657, i64 %t2658)
  store i64 %t2659, ptr %local.loss.2275
  %t2660 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.333)
  %t2661 = ptrtoint ptr %t2660 to i64
  %t2662 = inttoptr i64 %t2661 to ptr
  call void @intrinsic_print(ptr %t2662)
  %t2663 = load i64, ptr %local.loss.2275
  %t2664 = call i64 @"print_f64"(i64 %t2663)
  %t2665 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.334)
  %t2666 = ptrtoint ptr %t2665 to i64
  %t2667 = inttoptr i64 %t2666 to ptr
  call void @intrinsic_println(ptr %t2667)
  %t2668 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.335)
  %t2669 = ptrtoint ptr %t2668 to i64
  %t2670 = inttoptr i64 %t2669 to ptr
  call void @intrinsic_println(ptr %t2670)
  %t2671 = load i64, ptr %local.a01.2261
  %t2672 = load i64, ptr %local.a02.2262
  %t2673 = load i64, ptr %local.a03.2263
  %t2674 = load i64, ptr %local.a10.2264
  %t2675 = load i64, ptr %local.a12.2265
  %t2676 = load i64, ptr %local.a13.2266
  %t2677 = load i64, ptr %local.a20.2267
  %t2678 = load i64, ptr %local.a21.2268
  %t2679 = load i64, ptr %local.a23.2269
  %t2680 = load i64, ptr %local.a30.2270
  %t2681 = load i64, ptr %local.a31.2271
  %t2682 = load i64, ptr %local.a32.2272
  %t2683 = call i64 @"print_matrix_4x4"(i64 %t2671, i64 %t2672, i64 %t2673, i64 %t2674, i64 %t2675, i64 %t2676, i64 %t2677, i64 %t2678, i64 %t2679, i64 %t2680, i64 %t2681, i64 %t2682)
  store i64 %t2683, ptr %local.dummy.2281
  %t2684 = load i64, ptr %local.a01.2261
  store i64 %t2684, ptr %local.max_val.2276
  %t2685 = load i64, ptr %local.a02.2262
  %t2686 = load i64, ptr %local.max_val.2276
  %t2687 = call i64 @"sx_f64_gt"(i64 %t2685, i64 %t2686)
  %t2688 = icmp ne i64 %t2687, 0
  br i1 %t2688, label %then68, label %else68
then68:
  %t2689 = load i64, ptr %local.a02.2262
  store i64 %t2689, ptr %local.max_val.2276
  br label %then68_end
then68_end:
  br label %endif68
else68:
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t2690 = phi i64 [ 0, %then68_end ], [ 0, %else68_end ]
  %t2691 = load i64, ptr %local.a03.2263
  %t2692 = load i64, ptr %local.max_val.2276
  %t2693 = call i64 @"sx_f64_gt"(i64 %t2691, i64 %t2692)
  %t2694 = icmp ne i64 %t2693, 0
  br i1 %t2694, label %then69, label %else69
then69:
  %t2695 = load i64, ptr %local.a03.2263
  store i64 %t2695, ptr %local.max_val.2276
  br label %then69_end
then69_end:
  br label %endif69
else69:
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t2696 = phi i64 [ 0, %then69_end ], [ 0, %else69_end ]
  %t2697 = load i64, ptr %local.a10.2264
  %t2698 = load i64, ptr %local.max_val.2276
  %t2699 = call i64 @"sx_f64_gt"(i64 %t2697, i64 %t2698)
  %t2700 = icmp ne i64 %t2699, 0
  br i1 %t2700, label %then70, label %else70
then70:
  %t2701 = load i64, ptr %local.a10.2264
  store i64 %t2701, ptr %local.max_val.2276
  br label %then70_end
then70_end:
  br label %endif70
else70:
  br label %else70_end
else70_end:
  br label %endif70
endif70:
  %t2702 = phi i64 [ 0, %then70_end ], [ 0, %else70_end ]
  %t2703 = load i64, ptr %local.a12.2265
  %t2704 = load i64, ptr %local.max_val.2276
  %t2705 = call i64 @"sx_f64_gt"(i64 %t2703, i64 %t2704)
  %t2706 = icmp ne i64 %t2705, 0
  br i1 %t2706, label %then71, label %else71
then71:
  %t2707 = load i64, ptr %local.a12.2265
  store i64 %t2707, ptr %local.max_val.2276
  br label %then71_end
then71_end:
  br label %endif71
else71:
  br label %else71_end
else71_end:
  br label %endif71
endif71:
  %t2708 = phi i64 [ 0, %then71_end ], [ 0, %else71_end ]
  %t2709 = load i64, ptr %local.a13.2266
  %t2710 = load i64, ptr %local.max_val.2276
  %t2711 = call i64 @"sx_f64_gt"(i64 %t2709, i64 %t2710)
  %t2712 = icmp ne i64 %t2711, 0
  br i1 %t2712, label %then72, label %else72
then72:
  %t2713 = load i64, ptr %local.a13.2266
  store i64 %t2713, ptr %local.max_val.2276
  br label %then72_end
then72_end:
  br label %endif72
else72:
  br label %else72_end
else72_end:
  br label %endif72
endif72:
  %t2714 = phi i64 [ 0, %then72_end ], [ 0, %else72_end ]
  %t2715 = load i64, ptr %local.a20.2267
  %t2716 = load i64, ptr %local.max_val.2276
  %t2717 = call i64 @"sx_f64_gt"(i64 %t2715, i64 %t2716)
  %t2718 = icmp ne i64 %t2717, 0
  br i1 %t2718, label %then73, label %else73
then73:
  %t2719 = load i64, ptr %local.a20.2267
  store i64 %t2719, ptr %local.max_val.2276
  br label %then73_end
then73_end:
  br label %endif73
else73:
  br label %else73_end
else73_end:
  br label %endif73
endif73:
  %t2720 = phi i64 [ 0, %then73_end ], [ 0, %else73_end ]
  %t2721 = load i64, ptr %local.a21.2268
  %t2722 = load i64, ptr %local.max_val.2276
  %t2723 = call i64 @"sx_f64_gt"(i64 %t2721, i64 %t2722)
  %t2724 = icmp ne i64 %t2723, 0
  br i1 %t2724, label %then74, label %else74
then74:
  %t2725 = load i64, ptr %local.a21.2268
  store i64 %t2725, ptr %local.max_val.2276
  br label %then74_end
then74_end:
  br label %endif74
else74:
  br label %else74_end
else74_end:
  br label %endif74
endif74:
  %t2726 = phi i64 [ 0, %then74_end ], [ 0, %else74_end ]
  %t2727 = load i64, ptr %local.a23.2269
  %t2728 = load i64, ptr %local.max_val.2276
  %t2729 = call i64 @"sx_f64_gt"(i64 %t2727, i64 %t2728)
  %t2730 = icmp ne i64 %t2729, 0
  br i1 %t2730, label %then75, label %else75
then75:
  %t2731 = load i64, ptr %local.a23.2269
  store i64 %t2731, ptr %local.max_val.2276
  br label %then75_end
then75_end:
  br label %endif75
else75:
  br label %else75_end
else75_end:
  br label %endif75
endif75:
  %t2732 = phi i64 [ 0, %then75_end ], [ 0, %else75_end ]
  %t2733 = load i64, ptr %local.a30.2270
  %t2734 = load i64, ptr %local.max_val.2276
  %t2735 = call i64 @"sx_f64_gt"(i64 %t2733, i64 %t2734)
  %t2736 = icmp ne i64 %t2735, 0
  br i1 %t2736, label %then76, label %else76
then76:
  %t2737 = load i64, ptr %local.a30.2270
  store i64 %t2737, ptr %local.max_val.2276
  br label %then76_end
then76_end:
  br label %endif76
else76:
  br label %else76_end
else76_end:
  br label %endif76
endif76:
  %t2738 = phi i64 [ 0, %then76_end ], [ 0, %else76_end ]
  %t2739 = load i64, ptr %local.a31.2271
  %t2740 = load i64, ptr %local.max_val.2276
  %t2741 = call i64 @"sx_f64_gt"(i64 %t2739, i64 %t2740)
  %t2742 = icmp ne i64 %t2741, 0
  br i1 %t2742, label %then77, label %else77
then77:
  %t2743 = load i64, ptr %local.a31.2271
  store i64 %t2743, ptr %local.max_val.2276
  br label %then77_end
then77_end:
  br label %endif77
else77:
  br label %else77_end
else77_end:
  br label %endif77
endif77:
  %t2744 = phi i64 [ 0, %then77_end ], [ 0, %else77_end ]
  %t2745 = load i64, ptr %local.a32.2272
  %t2746 = load i64, ptr %local.max_val.2276
  %t2747 = call i64 @"sx_f64_gt"(i64 %t2745, i64 %t2746)
  %t2748 = icmp ne i64 %t2747, 0
  br i1 %t2748, label %then78, label %else78
then78:
  %t2749 = load i64, ptr %local.a32.2272
  store i64 %t2749, ptr %local.max_val.2276
  br label %then78_end
then78_end:
  br label %endif78
else78:
  br label %else78_end
else78_end:
  br label %endif78
endif78:
  %t2750 = phi i64 [ 0, %then78_end ], [ 0, %else78_end ]
  %t2751 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.336)
  %t2752 = ptrtoint ptr %t2751 to i64
  %t2753 = inttoptr i64 %t2752 to ptr
  call void @intrinsic_print(ptr %t2753)
  %t2754 = load i64, ptr %local.max_val.2276
  %t2755 = call i64 @"print_f64"(i64 %t2754)
  %t2756 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.337)
  %t2757 = ptrtoint ptr %t2756 to i64
  %t2758 = inttoptr i64 %t2757 to ptr
  call void @intrinsic_println(ptr %t2758)
  %t2759 = load i64, ptr %local.a01.2261
  store i64 %t2759, ptr %local.min_val.2277
  %t2760 = load i64, ptr %local.a02.2262
  %t2761 = load i64, ptr %local.min_val.2277
  %t2762 = call i64 @"sx_f64_lt"(i64 %t2760, i64 %t2761)
  %t2763 = icmp ne i64 %t2762, 0
  br i1 %t2763, label %then79, label %else79
then79:
  %t2764 = load i64, ptr %local.a02.2262
  store i64 %t2764, ptr %local.min_val.2277
  br label %then79_end
then79_end:
  br label %endif79
else79:
  br label %else79_end
else79_end:
  br label %endif79
endif79:
  %t2765 = phi i64 [ 0, %then79_end ], [ 0, %else79_end ]
  %t2766 = load i64, ptr %local.a03.2263
  %t2767 = load i64, ptr %local.min_val.2277
  %t2768 = call i64 @"sx_f64_lt"(i64 %t2766, i64 %t2767)
  %t2769 = icmp ne i64 %t2768, 0
  br i1 %t2769, label %then80, label %else80
then80:
  %t2770 = load i64, ptr %local.a03.2263
  store i64 %t2770, ptr %local.min_val.2277
  br label %then80_end
then80_end:
  br label %endif80
else80:
  br label %else80_end
else80_end:
  br label %endif80
endif80:
  %t2771 = phi i64 [ 0, %then80_end ], [ 0, %else80_end ]
  %t2772 = load i64, ptr %local.a10.2264
  %t2773 = load i64, ptr %local.min_val.2277
  %t2774 = call i64 @"sx_f64_lt"(i64 %t2772, i64 %t2773)
  %t2775 = icmp ne i64 %t2774, 0
  br i1 %t2775, label %then81, label %else81
then81:
  %t2776 = load i64, ptr %local.a10.2264
  store i64 %t2776, ptr %local.min_val.2277
  br label %then81_end
then81_end:
  br label %endif81
else81:
  br label %else81_end
else81_end:
  br label %endif81
endif81:
  %t2777 = phi i64 [ 0, %then81_end ], [ 0, %else81_end ]
  %t2778 = load i64, ptr %local.a12.2265
  %t2779 = load i64, ptr %local.min_val.2277
  %t2780 = call i64 @"sx_f64_lt"(i64 %t2778, i64 %t2779)
  %t2781 = icmp ne i64 %t2780, 0
  br i1 %t2781, label %then82, label %else82
then82:
  %t2782 = load i64, ptr %local.a12.2265
  store i64 %t2782, ptr %local.min_val.2277
  br label %then82_end
then82_end:
  br label %endif82
else82:
  br label %else82_end
else82_end:
  br label %endif82
endif82:
  %t2783 = phi i64 [ 0, %then82_end ], [ 0, %else82_end ]
  %t2784 = load i64, ptr %local.a13.2266
  %t2785 = load i64, ptr %local.min_val.2277
  %t2786 = call i64 @"sx_f64_lt"(i64 %t2784, i64 %t2785)
  %t2787 = icmp ne i64 %t2786, 0
  br i1 %t2787, label %then83, label %else83
then83:
  %t2788 = load i64, ptr %local.a13.2266
  store i64 %t2788, ptr %local.min_val.2277
  br label %then83_end
then83_end:
  br label %endif83
else83:
  br label %else83_end
else83_end:
  br label %endif83
endif83:
  %t2789 = phi i64 [ 0, %then83_end ], [ 0, %else83_end ]
  %t2790 = load i64, ptr %local.a20.2267
  %t2791 = load i64, ptr %local.min_val.2277
  %t2792 = call i64 @"sx_f64_lt"(i64 %t2790, i64 %t2791)
  %t2793 = icmp ne i64 %t2792, 0
  br i1 %t2793, label %then84, label %else84
then84:
  %t2794 = load i64, ptr %local.a20.2267
  store i64 %t2794, ptr %local.min_val.2277
  br label %then84_end
then84_end:
  br label %endif84
else84:
  br label %else84_end
else84_end:
  br label %endif84
endif84:
  %t2795 = phi i64 [ 0, %then84_end ], [ 0, %else84_end ]
  %t2796 = load i64, ptr %local.a21.2268
  %t2797 = load i64, ptr %local.min_val.2277
  %t2798 = call i64 @"sx_f64_lt"(i64 %t2796, i64 %t2797)
  %t2799 = icmp ne i64 %t2798, 0
  br i1 %t2799, label %then85, label %else85
then85:
  %t2800 = load i64, ptr %local.a21.2268
  store i64 %t2800, ptr %local.min_val.2277
  br label %then85_end
then85_end:
  br label %endif85
else85:
  br label %else85_end
else85_end:
  br label %endif85
endif85:
  %t2801 = phi i64 [ 0, %then85_end ], [ 0, %else85_end ]
  %t2802 = load i64, ptr %local.a23.2269
  %t2803 = load i64, ptr %local.min_val.2277
  %t2804 = call i64 @"sx_f64_lt"(i64 %t2802, i64 %t2803)
  %t2805 = icmp ne i64 %t2804, 0
  br i1 %t2805, label %then86, label %else86
then86:
  %t2806 = load i64, ptr %local.a23.2269
  store i64 %t2806, ptr %local.min_val.2277
  br label %then86_end
then86_end:
  br label %endif86
else86:
  br label %else86_end
else86_end:
  br label %endif86
endif86:
  %t2807 = phi i64 [ 0, %then86_end ], [ 0, %else86_end ]
  %t2808 = load i64, ptr %local.a30.2270
  %t2809 = load i64, ptr %local.min_val.2277
  %t2810 = call i64 @"sx_f64_lt"(i64 %t2808, i64 %t2809)
  %t2811 = icmp ne i64 %t2810, 0
  br i1 %t2811, label %then87, label %else87
then87:
  %t2812 = load i64, ptr %local.a30.2270
  store i64 %t2812, ptr %local.min_val.2277
  br label %then87_end
then87_end:
  br label %endif87
else87:
  br label %else87_end
else87_end:
  br label %endif87
endif87:
  %t2813 = phi i64 [ 0, %then87_end ], [ 0, %else87_end ]
  %t2814 = load i64, ptr %local.a31.2271
  %t2815 = load i64, ptr %local.min_val.2277
  %t2816 = call i64 @"sx_f64_lt"(i64 %t2814, i64 %t2815)
  %t2817 = icmp ne i64 %t2816, 0
  br i1 %t2817, label %then88, label %else88
then88:
  %t2818 = load i64, ptr %local.a31.2271
  store i64 %t2818, ptr %local.min_val.2277
  br label %then88_end
then88_end:
  br label %endif88
else88:
  br label %else88_end
else88_end:
  br label %endif88
endif88:
  %t2819 = phi i64 [ 0, %then88_end ], [ 0, %else88_end ]
  %t2820 = load i64, ptr %local.a32.2272
  %t2821 = load i64, ptr %local.min_val.2277
  %t2822 = call i64 @"sx_f64_lt"(i64 %t2820, i64 %t2821)
  %t2823 = icmp ne i64 %t2822, 0
  br i1 %t2823, label %then89, label %else89
then89:
  %t2824 = load i64, ptr %local.a32.2272
  store i64 %t2824, ptr %local.min_val.2277
  br label %then89_end
then89_end:
  br label %endif89
else89:
  br label %else89_end
else89_end:
  br label %endif89
endif89:
  %t2825 = phi i64 [ 0, %then89_end ], [ 0, %else89_end ]
  %t2826 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.338)
  %t2827 = ptrtoint ptr %t2826 to i64
  %t2828 = inttoptr i64 %t2827 to ptr
  call void @intrinsic_print(ptr %t2828)
  %t2829 = load i64, ptr %local.min_val.2277
  %t2830 = call i64 @"print_f64"(i64 %t2829)
  %t2831 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.339)
  %t2832 = ptrtoint ptr %t2831 to i64
  %t2833 = inttoptr i64 %t2832 to ptr
  call void @intrinsic_println(ptr %t2833)
  %t2834 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.340)
  %t2835 = ptrtoint ptr %t2834 to i64
  %t2836 = inttoptr i64 %t2835 to ptr
  call void @intrinsic_println(ptr %t2836)
  ret i64 0
}

define i64 @"experiment_2"() nounwind {
entry:
  %local.da.2837 = alloca i64
  %local.db.2838 = alloca i64
  %local.dc.2839 = alloca i64
  %t2840 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.341)
  %t2841 = ptrtoint ptr %t2840 to i64
  %t2842 = inttoptr i64 %t2841 to ptr
  call void @intrinsic_println(ptr %t2842)
  %t2843 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.342)
  %t2844 = ptrtoint ptr %t2843 to i64
  %t2845 = inttoptr i64 %t2844 to ptr
  call void @intrinsic_println(ptr %t2845)
  %t2846 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.343)
  %t2847 = ptrtoint ptr %t2846 to i64
  %t2848 = inttoptr i64 %t2847 to ptr
  call void @intrinsic_println(ptr %t2848)
  %t2849 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.344)
  %t2850 = ptrtoint ptr %t2849 to i64
  %t2851 = inttoptr i64 %t2850 to ptr
  call void @intrinsic_println(ptr %t2851)
  %t2852 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.345)
  %t2853 = ptrtoint ptr %t2852 to i64
  %t2854 = inttoptr i64 %t2853 to ptr
  call void @intrinsic_println(ptr %t2854)
  %t2855 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.346)
  %t2856 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.347)
  %t2857 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.348)
  %t2858 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.349)
  %t2859 = call i64 @"run_program_training"(i64 %t2855, i64 %t2856, i64 %t2857, i64 %t2858, i64 0)
  store i64 %t2859, ptr %local.da.2837
  %t2860 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.350)
  %t2861 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.351)
  %t2862 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.352)
  %t2863 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.353)
  %t2864 = call i64 @"run_program_training"(i64 %t2860, i64 %t2861, i64 %t2862, i64 %t2863, i64 1)
  store i64 %t2864, ptr %local.db.2838
  %t2865 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.354)
  %t2866 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.355)
  %t2867 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.356)
  %t2868 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.357)
  %t2869 = call i64 @"run_program_training"(i64 %t2865, i64 %t2866, i64 %t2867, i64 %t2868, i64 2)
  store i64 %t2869, ptr %local.dc.2839
  %t2870 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.358)
  %t2871 = ptrtoint ptr %t2870 to i64
  %t2872 = inttoptr i64 %t2871 to ptr
  call void @intrinsic_println(ptr %t2872)
  %t2873 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.359)
  %t2874 = ptrtoint ptr %t2873 to i64
  %t2875 = inttoptr i64 %t2874 to ptr
  call void @intrinsic_println(ptr %t2875)
  ret i64 0
}

define i64 @"compute_lyapunov"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %l0_init, i64 %l1_init, i64 %l2_init, i64 %l3_init, i64 %steps) nounwind {
entry:
  %local.l0.2876 = alloca i64
  %local.l1.2877 = alloca i64
  %local.l2.2878 = alloca i64
  %local.l3.2879 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.l0_init = alloca i64
  store i64 %l0_init, ptr %local.l0_init
  %local.l1_init = alloca i64
  store i64 %l1_init, ptr %local.l1_init
  %local.l2_init = alloca i64
  store i64 %l2_init, ptr %local.l2_init
  %local.l3_init = alloca i64
  store i64 %l3_init, ptr %local.l3_init
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t2880 = load i64, ptr %local.a01
  %t2881 = load i64, ptr %local.a02
  %t2882 = load i64, ptr %local.a03
  %t2883 = load i64, ptr %local.a10
  %t2884 = load i64, ptr %local.a12
  %t2885 = load i64, ptr %local.a13
  %t2886 = load i64, ptr %local.a20
  %t2887 = load i64, ptr %local.a21
  %t2888 = load i64, ptr %local.a23
  %t2889 = load i64, ptr %local.a30
  %t2890 = load i64, ptr %local.a31
  %t2891 = load i64, ptr %local.a32
  %t2892 = load i64, ptr %local.steps
  %t2893 = call i64 @"run_inner_pass_loss"(i64 %t2880, i64 %t2881, i64 %t2882, i64 %t2883, i64 %t2884, i64 %t2885, i64 %t2886, i64 %t2887, i64 %t2888, i64 %t2889, i64 %t2890, i64 %t2891, i64 0, i64 %t2892)
  store i64 %t2893, ptr %local.l0.2876
  %t2894 = load i64, ptr %local.a01
  %t2895 = load i64, ptr %local.a02
  %t2896 = load i64, ptr %local.a03
  %t2897 = load i64, ptr %local.a10
  %t2898 = load i64, ptr %local.a12
  %t2899 = load i64, ptr %local.a13
  %t2900 = load i64, ptr %local.a20
  %t2901 = load i64, ptr %local.a21
  %t2902 = load i64, ptr %local.a23
  %t2903 = load i64, ptr %local.a30
  %t2904 = load i64, ptr %local.a31
  %t2905 = load i64, ptr %local.a32
  %t2906 = load i64, ptr %local.steps
  %t2907 = call i64 @"run_inner_pass_loss"(i64 %t2894, i64 %t2895, i64 %t2896, i64 %t2897, i64 %t2898, i64 %t2899, i64 %t2900, i64 %t2901, i64 %t2902, i64 %t2903, i64 %t2904, i64 %t2905, i64 1, i64 %t2906)
  store i64 %t2907, ptr %local.l1.2877
  %t2908 = load i64, ptr %local.a01
  %t2909 = load i64, ptr %local.a02
  %t2910 = load i64, ptr %local.a03
  %t2911 = load i64, ptr %local.a10
  %t2912 = load i64, ptr %local.a12
  %t2913 = load i64, ptr %local.a13
  %t2914 = load i64, ptr %local.a20
  %t2915 = load i64, ptr %local.a21
  %t2916 = load i64, ptr %local.a23
  %t2917 = load i64, ptr %local.a30
  %t2918 = load i64, ptr %local.a31
  %t2919 = load i64, ptr %local.a32
  %t2920 = load i64, ptr %local.steps
  %t2921 = call i64 @"run_inner_pass_loss"(i64 %t2908, i64 %t2909, i64 %t2910, i64 %t2911, i64 %t2912, i64 %t2913, i64 %t2914, i64 %t2915, i64 %t2916, i64 %t2917, i64 %t2918, i64 %t2919, i64 2, i64 %t2920)
  store i64 %t2921, ptr %local.l2.2878
  %t2922 = load i64, ptr %local.a01
  %t2923 = load i64, ptr %local.a02
  %t2924 = load i64, ptr %local.a03
  %t2925 = load i64, ptr %local.a10
  %t2926 = load i64, ptr %local.a12
  %t2927 = load i64, ptr %local.a13
  %t2928 = load i64, ptr %local.a20
  %t2929 = load i64, ptr %local.a21
  %t2930 = load i64, ptr %local.a23
  %t2931 = load i64, ptr %local.a30
  %t2932 = load i64, ptr %local.a31
  %t2933 = load i64, ptr %local.a32
  %t2934 = load i64, ptr %local.steps
  %t2935 = call i64 @"run_inner_pass_loss"(i64 %t2922, i64 %t2923, i64 %t2924, i64 %t2925, i64 %t2926, i64 %t2927, i64 %t2928, i64 %t2929, i64 %t2930, i64 %t2931, i64 %t2932, i64 %t2933, i64 3, i64 %t2934)
  store i64 %t2935, ptr %local.l3.2879
  %t2936 = load i64, ptr %local.l0.2876
  %t2937 = load i64, ptr %local.l0_init
  %t2938 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.360)
  %t2939 = call i64 @"sx_f64_add"(i64 %t2937, i64 %t2938)
  %t2940 = call i64 @"sx_f64_div"(i64 %t2936, i64 %t2939)
  %t2941 = load i64, ptr %local.l1.2877
  %t2942 = load i64, ptr %local.l1_init
  %t2943 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.361)
  %t2944 = call i64 @"sx_f64_add"(i64 %t2942, i64 %t2943)
  %t2945 = call i64 @"sx_f64_div"(i64 %t2941, i64 %t2944)
  %t2946 = call i64 @"sx_f64_add"(i64 %t2940, i64 %t2945)
  %t2947 = load i64, ptr %local.l2.2878
  %t2948 = load i64, ptr %local.l2_init
  %t2949 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.362)
  %t2950 = call i64 @"sx_f64_add"(i64 %t2948, i64 %t2949)
  %t2951 = call i64 @"sx_f64_div"(i64 %t2947, i64 %t2950)
  %t2952 = call i64 @"sx_f64_add"(i64 %t2946, i64 %t2951)
  %t2953 = load i64, ptr %local.l3.2879
  %t2954 = load i64, ptr %local.l3_init
  %t2955 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.363)
  %t2956 = call i64 @"sx_f64_add"(i64 %t2954, i64 %t2955)
  %t2957 = call i64 @"sx_f64_div"(i64 %t2953, i64 %t2956)
  %t2958 = call i64 @"sx_f64_add"(i64 %t2952, i64 %t2957)
  ret i64 %t2958
}

define i64 @"experiment_3"() nounwind {
entry:
  %local.a01.2959 = alloca i64
  %local.a02.2960 = alloca i64
  %local.a03.2961 = alloca i64
  %local.a10.2962 = alloca i64
  %local.a12.2963 = alloca i64
  %local.a13.2964 = alloca i64
  %local.a20.2965 = alloca i64
  %local.a21.2966 = alloca i64
  %local.a23.2967 = alloca i64
  %local.a30.2968 = alloca i64
  %local.a31.2969 = alloca i64
  %local.a32.2970 = alloca i64
  %local.mg.2971 = alloca i64
  %local.cycle.2972 = alloca i64
  %local.prev_v.2973 = alloca i64
  %local.score.2974 = alloca i64
  %local.v_now.2975 = alloca i64
  %local.crossed.2976 = alloca i64
  %local.meta_lr.2977 = alloca i64
  %local.inner_steps.2978 = alloca i64
  %local.meta_cycles.2979 = alloca i64
  %local.l0_init.2980 = alloca i64
  %local.l1_init.2981 = alloca i64
  %local.l2_init.2982 = alloca i64
  %local.l3_init.2983 = alloca i64
  %t2984 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.364)
  store i64 %t2984, ptr %local.a01.2959
  %t2985 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.365)
  store i64 %t2985, ptr %local.a02.2960
  %t2986 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.366)
  store i64 %t2986, ptr %local.a03.2961
  %t2987 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.367)
  store i64 %t2987, ptr %local.a10.2962
  %t2988 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.368)
  store i64 %t2988, ptr %local.a12.2963
  %t2989 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.369)
  store i64 %t2989, ptr %local.a13.2964
  %t2990 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.370)
  store i64 %t2990, ptr %local.a20.2965
  %t2991 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.371)
  store i64 %t2991, ptr %local.a21.2966
  %t2992 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.372)
  store i64 %t2992, ptr %local.a23.2967
  %t2993 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.373)
  store i64 %t2993, ptr %local.a30.2968
  %t2994 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.374)
  store i64 %t2994, ptr %local.a31.2969
  %t2995 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.375)
  store i64 %t2995, ptr %local.a32.2970
  %t2996 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.376)
  store i64 %t2996, ptr %local.mg.2971
  store i64 0, ptr %local.cycle.2972
  %t2997 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.377)
  store i64 %t2997, ptr %local.prev_v.2973
  %t2998 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.378)
  store i64 %t2998, ptr %local.score.2974
  %t2999 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.379)
  store i64 %t2999, ptr %local.v_now.2975
  store i64 0, ptr %local.crossed.2976
  %t3000 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.380)
  store i64 %t3000, ptr %local.meta_lr.2977
  store i64 200, ptr %local.inner_steps.2978
  store i64 50, ptr %local.meta_cycles.2979
  %t3001 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.381)
  %t3002 = ptrtoint ptr %t3001 to i64
  %t3003 = inttoptr i64 %t3002 to ptr
  call void @intrinsic_println(ptr %t3003)
  %t3004 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.382)
  %t3005 = ptrtoint ptr %t3004 to i64
  %t3006 = inttoptr i64 %t3005 to ptr
  call void @intrinsic_println(ptr %t3006)
  %t3007 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.383)
  %t3008 = ptrtoint ptr %t3007 to i64
  %t3009 = inttoptr i64 %t3008 to ptr
  call void @intrinsic_println(ptr %t3009)
  %t3010 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.384)
  %t3011 = ptrtoint ptr %t3010 to i64
  %t3012 = inttoptr i64 %t3011 to ptr
  call void @intrinsic_println(ptr %t3012)
  %t3013 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.385)
  %t3014 = ptrtoint ptr %t3013 to i64
  %t3015 = inttoptr i64 %t3014 to ptr
  call void @intrinsic_println(ptr %t3015)
  %t3016 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.386)
  %t3017 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.387)
  %t3018 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.388)
  %t3019 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.389)
  %t3020 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.390)
  %t3021 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.391)
  %t3022 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.392)
  %t3023 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.393)
  %t3024 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.394)
  %t3025 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.395)
  %t3026 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.396)
  %t3027 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.397)
  %t3028 = load i64, ptr %local.inner_steps.2978
  %t3029 = call i64 @"run_inner_pass_loss"(i64 %t3016, i64 %t3017, i64 %t3018, i64 %t3019, i64 %t3020, i64 %t3021, i64 %t3022, i64 %t3023, i64 %t3024, i64 %t3025, i64 %t3026, i64 %t3027, i64 0, i64 %t3028)
  store i64 %t3029, ptr %local.l0_init.2980
  %t3030 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.398)
  %t3031 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.399)
  %t3032 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.400)
  %t3033 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.401)
  %t3034 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.402)
  %t3035 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.403)
  %t3036 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.404)
  %t3037 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.405)
  %t3038 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.406)
  %t3039 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.407)
  %t3040 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.408)
  %t3041 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.409)
  %t3042 = load i64, ptr %local.inner_steps.2978
  %t3043 = call i64 @"run_inner_pass_loss"(i64 %t3030, i64 %t3031, i64 %t3032, i64 %t3033, i64 %t3034, i64 %t3035, i64 %t3036, i64 %t3037, i64 %t3038, i64 %t3039, i64 %t3040, i64 %t3041, i64 1, i64 %t3042)
  store i64 %t3043, ptr %local.l1_init.2981
  %t3044 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.410)
  %t3045 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.411)
  %t3046 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.412)
  %t3047 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.413)
  %t3048 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.414)
  %t3049 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.415)
  %t3050 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.416)
  %t3051 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.417)
  %t3052 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.418)
  %t3053 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.419)
  %t3054 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.420)
  %t3055 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.421)
  %t3056 = load i64, ptr %local.inner_steps.2978
  %t3057 = call i64 @"run_inner_pass_loss"(i64 %t3044, i64 %t3045, i64 %t3046, i64 %t3047, i64 %t3048, i64 %t3049, i64 %t3050, i64 %t3051, i64 %t3052, i64 %t3053, i64 %t3054, i64 %t3055, i64 2, i64 %t3056)
  store i64 %t3057, ptr %local.l2_init.2982
  %t3058 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.422)
  %t3059 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.423)
  %t3060 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.424)
  %t3061 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.425)
  %t3062 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.426)
  %t3063 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.427)
  %t3064 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.428)
  %t3065 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.429)
  %t3066 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.430)
  %t3067 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.431)
  %t3068 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.432)
  %t3069 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.433)
  %t3070 = load i64, ptr %local.inner_steps.2978
  %t3071 = call i64 @"run_inner_pass_loss"(i64 %t3058, i64 %t3059, i64 %t3060, i64 %t3061, i64 %t3062, i64 %t3063, i64 %t3064, i64 %t3065, i64 %t3066, i64 %t3067, i64 %t3068, i64 %t3069, i64 3, i64 %t3070)
  store i64 %t3071, ptr %local.l3_init.2983
  %t3072 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.434)
  %t3073 = ptrtoint ptr %t3072 to i64
  %t3074 = inttoptr i64 %t3073 to ptr
  call void @intrinsic_print(ptr %t3074)
  %t3075 = load i64, ptr %local.l0_init.2980
  %t3076 = call i64 @"print_f64"(i64 %t3075)
  %t3077 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.435)
  %t3078 = ptrtoint ptr %t3077 to i64
  %t3079 = inttoptr i64 %t3078 to ptr
  call void @intrinsic_print(ptr %t3079)
  %t3080 = load i64, ptr %local.l1_init.2981
  %t3081 = call i64 @"print_f64"(i64 %t3080)
  %t3082 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.436)
  %t3083 = ptrtoint ptr %t3082 to i64
  %t3084 = inttoptr i64 %t3083 to ptr
  call void @intrinsic_print(ptr %t3084)
  %t3085 = load i64, ptr %local.l2_init.2982
  %t3086 = call i64 @"print_f64"(i64 %t3085)
  %t3087 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.437)
  %t3088 = ptrtoint ptr %t3087 to i64
  %t3089 = inttoptr i64 %t3088 to ptr
  call void @intrinsic_print(ptr %t3089)
  %t3090 = load i64, ptr %local.l3_init.2983
  %t3091 = call i64 @"print_f64"(i64 %t3090)
  %t3092 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.438)
  %t3093 = ptrtoint ptr %t3092 to i64
  %t3094 = inttoptr i64 %t3093 to ptr
  call void @intrinsic_println(ptr %t3094)
  %t3095 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.439)
  %t3096 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.440)
  %t3097 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.441)
  %t3098 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.442)
  %t3099 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.443)
  %t3100 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.444)
  %t3101 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.445)
  %t3102 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.446)
  %t3103 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.447)
  %t3104 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.448)
  %t3105 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.449)
  %t3106 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.450)
  %t3107 = load i64, ptr %local.l0_init.2980
  %t3108 = load i64, ptr %local.l1_init.2981
  %t3109 = load i64, ptr %local.l2_init.2982
  %t3110 = load i64, ptr %local.l3_init.2983
  %t3111 = load i64, ptr %local.inner_steps.2978
  %t3112 = call i64 @"compute_lyapunov"(i64 %t3095, i64 %t3096, i64 %t3097, i64 %t3098, i64 %t3099, i64 %t3100, i64 %t3101, i64 %t3102, i64 %t3103, i64 %t3104, i64 %t3105, i64 %t3106, i64 %t3107, i64 %t3108, i64 %t3109, i64 %t3110, i64 %t3111)
  store i64 %t3112, ptr %local.prev_v.2973
  %t3113 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.451)
  %t3114 = ptrtoint ptr %t3113 to i64
  %t3115 = inttoptr i64 %t3114 to ptr
  call void @intrinsic_print(ptr %t3115)
  %t3116 = load i64, ptr %local.prev_v.2973
  %t3117 = call i64 @"print_f64"(i64 %t3116)
  %t3118 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.452)
  %t3119 = ptrtoint ptr %t3118 to i64
  %t3120 = inttoptr i64 %t3119 to ptr
  call void @intrinsic_println(ptr %t3120)
  %t3121 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.453)
  %t3122 = ptrtoint ptr %t3121 to i64
  %t3123 = inttoptr i64 %t3122 to ptr
  call void @intrinsic_println(ptr %t3123)
  %t3124 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.454)
  %t3125 = ptrtoint ptr %t3124 to i64
  %t3126 = inttoptr i64 %t3125 to ptr
  call void @intrinsic_println(ptr %t3126)
  %t3127 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.455)
  %t3128 = ptrtoint ptr %t3127 to i64
  %t3129 = inttoptr i64 %t3128 to ptr
  call void @intrinsic_println(ptr %t3129)
  br label %loop90
loop90:
  %t3130 = load i64, ptr %local.cycle.2972
  %t3131 = load i64, ptr %local.meta_cycles.2979
  %t3132 = icmp slt i64 %t3130, %t3131
  %t3133 = zext i1 %t3132 to i64
  %t3134 = icmp ne i64 %t3133, 0
  br i1 %t3134, label %body90, label %endloop90
body90:
  %t3135 = load i64, ptr %local.a01.2959
  %t3136 = load i64, ptr %local.a02.2960
  %t3137 = load i64, ptr %local.a03.2961
  %t3138 = load i64, ptr %local.a10.2962
  %t3139 = load i64, ptr %local.a12.2963
  %t3140 = load i64, ptr %local.a13.2964
  %t3141 = load i64, ptr %local.a20.2965
  %t3142 = load i64, ptr %local.a21.2966
  %t3143 = load i64, ptr %local.a23.2967
  %t3144 = load i64, ptr %local.a30.2968
  %t3145 = load i64, ptr %local.a31.2969
  %t3146 = load i64, ptr %local.a32.2970
  %t3147 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.456)
  %t3148 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.457)
  %t3149 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.458)
  %t3150 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.459)
  %t3151 = load i64, ptr %local.inner_steps.2978
  %t3152 = call i64 @"meta_grad_one"(i64 %t3135, i64 %t3136, i64 %t3137, i64 %t3138, i64 %t3139, i64 %t3140, i64 %t3141, i64 %t3142, i64 %t3143, i64 %t3144, i64 %t3145, i64 %t3146, i64 %t3147, i64 %t3148, i64 %t3149, i64 %t3150, i64 0, i64 %t3151)
  store i64 %t3152, ptr %local.mg.2971
  %t3153 = load i64, ptr %local.a01.2959
  %t3154 = load i64, ptr %local.meta_lr.2977
  %t3155 = load i64, ptr %local.mg.2971
  %t3156 = call i64 @"sx_f64_mul"(i64 %t3154, i64 %t3155)
  %t3157 = call i64 @"sx_f64_sub"(i64 %t3153, i64 %t3156)
  %t3158 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.460)
  %t3159 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.461)
  %t3160 = call i64 @"clamp"(i64 %t3157, i64 %t3158, i64 %t3159)
  store i64 %t3160, ptr %local.a01.2959
  %t3161 = load i64, ptr %local.a01.2959
  %t3162 = load i64, ptr %local.a02.2960
  %t3163 = load i64, ptr %local.a03.2961
  %t3164 = load i64, ptr %local.a10.2962
  %t3165 = load i64, ptr %local.a12.2963
  %t3166 = load i64, ptr %local.a13.2964
  %t3167 = load i64, ptr %local.a20.2965
  %t3168 = load i64, ptr %local.a21.2966
  %t3169 = load i64, ptr %local.a23.2967
  %t3170 = load i64, ptr %local.a30.2968
  %t3171 = load i64, ptr %local.a31.2969
  %t3172 = load i64, ptr %local.a32.2970
  %t3173 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.462)
  %t3174 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.463)
  %t3175 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.464)
  %t3176 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.465)
  %t3177 = load i64, ptr %local.inner_steps.2978
  %t3178 = call i64 @"meta_grad_one"(i64 %t3161, i64 %t3162, i64 %t3163, i64 %t3164, i64 %t3165, i64 %t3166, i64 %t3167, i64 %t3168, i64 %t3169, i64 %t3170, i64 %t3171, i64 %t3172, i64 %t3173, i64 %t3174, i64 %t3175, i64 %t3176, i64 1, i64 %t3177)
  store i64 %t3178, ptr %local.mg.2971
  %t3179 = load i64, ptr %local.a02.2960
  %t3180 = load i64, ptr %local.meta_lr.2977
  %t3181 = load i64, ptr %local.mg.2971
  %t3182 = call i64 @"sx_f64_mul"(i64 %t3180, i64 %t3181)
  %t3183 = call i64 @"sx_f64_sub"(i64 %t3179, i64 %t3182)
  %t3184 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.466)
  %t3185 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.467)
  %t3186 = call i64 @"clamp"(i64 %t3183, i64 %t3184, i64 %t3185)
  store i64 %t3186, ptr %local.a02.2960
  %t3187 = load i64, ptr %local.a01.2959
  %t3188 = load i64, ptr %local.a02.2960
  %t3189 = load i64, ptr %local.a03.2961
  %t3190 = load i64, ptr %local.a10.2962
  %t3191 = load i64, ptr %local.a12.2963
  %t3192 = load i64, ptr %local.a13.2964
  %t3193 = load i64, ptr %local.a20.2965
  %t3194 = load i64, ptr %local.a21.2966
  %t3195 = load i64, ptr %local.a23.2967
  %t3196 = load i64, ptr %local.a30.2968
  %t3197 = load i64, ptr %local.a31.2969
  %t3198 = load i64, ptr %local.a32.2970
  %t3199 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.468)
  %t3200 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.469)
  %t3201 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.470)
  %t3202 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.471)
  %t3203 = load i64, ptr %local.inner_steps.2978
  %t3204 = call i64 @"meta_grad_one"(i64 %t3187, i64 %t3188, i64 %t3189, i64 %t3190, i64 %t3191, i64 %t3192, i64 %t3193, i64 %t3194, i64 %t3195, i64 %t3196, i64 %t3197, i64 %t3198, i64 %t3199, i64 %t3200, i64 %t3201, i64 %t3202, i64 2, i64 %t3203)
  store i64 %t3204, ptr %local.mg.2971
  %t3205 = load i64, ptr %local.a03.2961
  %t3206 = load i64, ptr %local.meta_lr.2977
  %t3207 = load i64, ptr %local.mg.2971
  %t3208 = call i64 @"sx_f64_mul"(i64 %t3206, i64 %t3207)
  %t3209 = call i64 @"sx_f64_sub"(i64 %t3205, i64 %t3208)
  %t3210 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.472)
  %t3211 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.473)
  %t3212 = call i64 @"clamp"(i64 %t3209, i64 %t3210, i64 %t3211)
  store i64 %t3212, ptr %local.a03.2961
  %t3213 = load i64, ptr %local.a01.2959
  %t3214 = load i64, ptr %local.a02.2960
  %t3215 = load i64, ptr %local.a03.2961
  %t3216 = load i64, ptr %local.a10.2962
  %t3217 = load i64, ptr %local.a12.2963
  %t3218 = load i64, ptr %local.a13.2964
  %t3219 = load i64, ptr %local.a20.2965
  %t3220 = load i64, ptr %local.a21.2966
  %t3221 = load i64, ptr %local.a23.2967
  %t3222 = load i64, ptr %local.a30.2968
  %t3223 = load i64, ptr %local.a31.2969
  %t3224 = load i64, ptr %local.a32.2970
  %t3225 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.474)
  %t3226 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.475)
  %t3227 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.476)
  %t3228 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.477)
  %t3229 = load i64, ptr %local.inner_steps.2978
  %t3230 = call i64 @"meta_grad_one"(i64 %t3213, i64 %t3214, i64 %t3215, i64 %t3216, i64 %t3217, i64 %t3218, i64 %t3219, i64 %t3220, i64 %t3221, i64 %t3222, i64 %t3223, i64 %t3224, i64 %t3225, i64 %t3226, i64 %t3227, i64 %t3228, i64 3, i64 %t3229)
  store i64 %t3230, ptr %local.mg.2971
  %t3231 = load i64, ptr %local.a10.2962
  %t3232 = load i64, ptr %local.meta_lr.2977
  %t3233 = load i64, ptr %local.mg.2971
  %t3234 = call i64 @"sx_f64_mul"(i64 %t3232, i64 %t3233)
  %t3235 = call i64 @"sx_f64_sub"(i64 %t3231, i64 %t3234)
  %t3236 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.478)
  %t3237 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.479)
  %t3238 = call i64 @"clamp"(i64 %t3235, i64 %t3236, i64 %t3237)
  store i64 %t3238, ptr %local.a10.2962
  %t3239 = load i64, ptr %local.a01.2959
  %t3240 = load i64, ptr %local.a02.2960
  %t3241 = load i64, ptr %local.a03.2961
  %t3242 = load i64, ptr %local.a10.2962
  %t3243 = load i64, ptr %local.a12.2963
  %t3244 = load i64, ptr %local.a13.2964
  %t3245 = load i64, ptr %local.a20.2965
  %t3246 = load i64, ptr %local.a21.2966
  %t3247 = load i64, ptr %local.a23.2967
  %t3248 = load i64, ptr %local.a30.2968
  %t3249 = load i64, ptr %local.a31.2969
  %t3250 = load i64, ptr %local.a32.2970
  %t3251 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.480)
  %t3252 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.481)
  %t3253 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.482)
  %t3254 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.483)
  %t3255 = load i64, ptr %local.inner_steps.2978
  %t3256 = call i64 @"meta_grad_one"(i64 %t3239, i64 %t3240, i64 %t3241, i64 %t3242, i64 %t3243, i64 %t3244, i64 %t3245, i64 %t3246, i64 %t3247, i64 %t3248, i64 %t3249, i64 %t3250, i64 %t3251, i64 %t3252, i64 %t3253, i64 %t3254, i64 4, i64 %t3255)
  store i64 %t3256, ptr %local.mg.2971
  %t3257 = load i64, ptr %local.a12.2963
  %t3258 = load i64, ptr %local.meta_lr.2977
  %t3259 = load i64, ptr %local.mg.2971
  %t3260 = call i64 @"sx_f64_mul"(i64 %t3258, i64 %t3259)
  %t3261 = call i64 @"sx_f64_sub"(i64 %t3257, i64 %t3260)
  %t3262 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.484)
  %t3263 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.485)
  %t3264 = call i64 @"clamp"(i64 %t3261, i64 %t3262, i64 %t3263)
  store i64 %t3264, ptr %local.a12.2963
  %t3265 = load i64, ptr %local.a01.2959
  %t3266 = load i64, ptr %local.a02.2960
  %t3267 = load i64, ptr %local.a03.2961
  %t3268 = load i64, ptr %local.a10.2962
  %t3269 = load i64, ptr %local.a12.2963
  %t3270 = load i64, ptr %local.a13.2964
  %t3271 = load i64, ptr %local.a20.2965
  %t3272 = load i64, ptr %local.a21.2966
  %t3273 = load i64, ptr %local.a23.2967
  %t3274 = load i64, ptr %local.a30.2968
  %t3275 = load i64, ptr %local.a31.2969
  %t3276 = load i64, ptr %local.a32.2970
  %t3277 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.486)
  %t3278 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.487)
  %t3279 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.488)
  %t3280 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.489)
  %t3281 = load i64, ptr %local.inner_steps.2978
  %t3282 = call i64 @"meta_grad_one"(i64 %t3265, i64 %t3266, i64 %t3267, i64 %t3268, i64 %t3269, i64 %t3270, i64 %t3271, i64 %t3272, i64 %t3273, i64 %t3274, i64 %t3275, i64 %t3276, i64 %t3277, i64 %t3278, i64 %t3279, i64 %t3280, i64 5, i64 %t3281)
  store i64 %t3282, ptr %local.mg.2971
  %t3283 = load i64, ptr %local.a13.2964
  %t3284 = load i64, ptr %local.meta_lr.2977
  %t3285 = load i64, ptr %local.mg.2971
  %t3286 = call i64 @"sx_f64_mul"(i64 %t3284, i64 %t3285)
  %t3287 = call i64 @"sx_f64_sub"(i64 %t3283, i64 %t3286)
  %t3288 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.490)
  %t3289 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.491)
  %t3290 = call i64 @"clamp"(i64 %t3287, i64 %t3288, i64 %t3289)
  store i64 %t3290, ptr %local.a13.2964
  %t3291 = load i64, ptr %local.a01.2959
  %t3292 = load i64, ptr %local.a02.2960
  %t3293 = load i64, ptr %local.a03.2961
  %t3294 = load i64, ptr %local.a10.2962
  %t3295 = load i64, ptr %local.a12.2963
  %t3296 = load i64, ptr %local.a13.2964
  %t3297 = load i64, ptr %local.a20.2965
  %t3298 = load i64, ptr %local.a21.2966
  %t3299 = load i64, ptr %local.a23.2967
  %t3300 = load i64, ptr %local.a30.2968
  %t3301 = load i64, ptr %local.a31.2969
  %t3302 = load i64, ptr %local.a32.2970
  %t3303 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.492)
  %t3304 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.493)
  %t3305 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.494)
  %t3306 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.495)
  %t3307 = load i64, ptr %local.inner_steps.2978
  %t3308 = call i64 @"meta_grad_one"(i64 %t3291, i64 %t3292, i64 %t3293, i64 %t3294, i64 %t3295, i64 %t3296, i64 %t3297, i64 %t3298, i64 %t3299, i64 %t3300, i64 %t3301, i64 %t3302, i64 %t3303, i64 %t3304, i64 %t3305, i64 %t3306, i64 6, i64 %t3307)
  store i64 %t3308, ptr %local.mg.2971
  %t3309 = load i64, ptr %local.a20.2965
  %t3310 = load i64, ptr %local.meta_lr.2977
  %t3311 = load i64, ptr %local.mg.2971
  %t3312 = call i64 @"sx_f64_mul"(i64 %t3310, i64 %t3311)
  %t3313 = call i64 @"sx_f64_sub"(i64 %t3309, i64 %t3312)
  %t3314 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.496)
  %t3315 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.497)
  %t3316 = call i64 @"clamp"(i64 %t3313, i64 %t3314, i64 %t3315)
  store i64 %t3316, ptr %local.a20.2965
  %t3317 = load i64, ptr %local.a01.2959
  %t3318 = load i64, ptr %local.a02.2960
  %t3319 = load i64, ptr %local.a03.2961
  %t3320 = load i64, ptr %local.a10.2962
  %t3321 = load i64, ptr %local.a12.2963
  %t3322 = load i64, ptr %local.a13.2964
  %t3323 = load i64, ptr %local.a20.2965
  %t3324 = load i64, ptr %local.a21.2966
  %t3325 = load i64, ptr %local.a23.2967
  %t3326 = load i64, ptr %local.a30.2968
  %t3327 = load i64, ptr %local.a31.2969
  %t3328 = load i64, ptr %local.a32.2970
  %t3329 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.498)
  %t3330 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.499)
  %t3331 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.500)
  %t3332 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.501)
  %t3333 = load i64, ptr %local.inner_steps.2978
  %t3334 = call i64 @"meta_grad_one"(i64 %t3317, i64 %t3318, i64 %t3319, i64 %t3320, i64 %t3321, i64 %t3322, i64 %t3323, i64 %t3324, i64 %t3325, i64 %t3326, i64 %t3327, i64 %t3328, i64 %t3329, i64 %t3330, i64 %t3331, i64 %t3332, i64 7, i64 %t3333)
  store i64 %t3334, ptr %local.mg.2971
  %t3335 = load i64, ptr %local.a21.2966
  %t3336 = load i64, ptr %local.meta_lr.2977
  %t3337 = load i64, ptr %local.mg.2971
  %t3338 = call i64 @"sx_f64_mul"(i64 %t3336, i64 %t3337)
  %t3339 = call i64 @"sx_f64_sub"(i64 %t3335, i64 %t3338)
  %t3340 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.502)
  %t3341 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.503)
  %t3342 = call i64 @"clamp"(i64 %t3339, i64 %t3340, i64 %t3341)
  store i64 %t3342, ptr %local.a21.2966
  %t3343 = load i64, ptr %local.a01.2959
  %t3344 = load i64, ptr %local.a02.2960
  %t3345 = load i64, ptr %local.a03.2961
  %t3346 = load i64, ptr %local.a10.2962
  %t3347 = load i64, ptr %local.a12.2963
  %t3348 = load i64, ptr %local.a13.2964
  %t3349 = load i64, ptr %local.a20.2965
  %t3350 = load i64, ptr %local.a21.2966
  %t3351 = load i64, ptr %local.a23.2967
  %t3352 = load i64, ptr %local.a30.2968
  %t3353 = load i64, ptr %local.a31.2969
  %t3354 = load i64, ptr %local.a32.2970
  %t3355 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.504)
  %t3356 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.505)
  %t3357 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.506)
  %t3358 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.507)
  %t3359 = load i64, ptr %local.inner_steps.2978
  %t3360 = call i64 @"meta_grad_one"(i64 %t3343, i64 %t3344, i64 %t3345, i64 %t3346, i64 %t3347, i64 %t3348, i64 %t3349, i64 %t3350, i64 %t3351, i64 %t3352, i64 %t3353, i64 %t3354, i64 %t3355, i64 %t3356, i64 %t3357, i64 %t3358, i64 8, i64 %t3359)
  store i64 %t3360, ptr %local.mg.2971
  %t3361 = load i64, ptr %local.a23.2967
  %t3362 = load i64, ptr %local.meta_lr.2977
  %t3363 = load i64, ptr %local.mg.2971
  %t3364 = call i64 @"sx_f64_mul"(i64 %t3362, i64 %t3363)
  %t3365 = call i64 @"sx_f64_sub"(i64 %t3361, i64 %t3364)
  %t3366 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.508)
  %t3367 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.509)
  %t3368 = call i64 @"clamp"(i64 %t3365, i64 %t3366, i64 %t3367)
  store i64 %t3368, ptr %local.a23.2967
  %t3369 = load i64, ptr %local.a01.2959
  %t3370 = load i64, ptr %local.a02.2960
  %t3371 = load i64, ptr %local.a03.2961
  %t3372 = load i64, ptr %local.a10.2962
  %t3373 = load i64, ptr %local.a12.2963
  %t3374 = load i64, ptr %local.a13.2964
  %t3375 = load i64, ptr %local.a20.2965
  %t3376 = load i64, ptr %local.a21.2966
  %t3377 = load i64, ptr %local.a23.2967
  %t3378 = load i64, ptr %local.a30.2968
  %t3379 = load i64, ptr %local.a31.2969
  %t3380 = load i64, ptr %local.a32.2970
  %t3381 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.510)
  %t3382 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.511)
  %t3383 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.512)
  %t3384 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.513)
  %t3385 = load i64, ptr %local.inner_steps.2978
  %t3386 = call i64 @"meta_grad_one"(i64 %t3369, i64 %t3370, i64 %t3371, i64 %t3372, i64 %t3373, i64 %t3374, i64 %t3375, i64 %t3376, i64 %t3377, i64 %t3378, i64 %t3379, i64 %t3380, i64 %t3381, i64 %t3382, i64 %t3383, i64 %t3384, i64 9, i64 %t3385)
  store i64 %t3386, ptr %local.mg.2971
  %t3387 = load i64, ptr %local.a30.2968
  %t3388 = load i64, ptr %local.meta_lr.2977
  %t3389 = load i64, ptr %local.mg.2971
  %t3390 = call i64 @"sx_f64_mul"(i64 %t3388, i64 %t3389)
  %t3391 = call i64 @"sx_f64_sub"(i64 %t3387, i64 %t3390)
  %t3392 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.514)
  %t3393 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.515)
  %t3394 = call i64 @"clamp"(i64 %t3391, i64 %t3392, i64 %t3393)
  store i64 %t3394, ptr %local.a30.2968
  %t3395 = load i64, ptr %local.a01.2959
  %t3396 = load i64, ptr %local.a02.2960
  %t3397 = load i64, ptr %local.a03.2961
  %t3398 = load i64, ptr %local.a10.2962
  %t3399 = load i64, ptr %local.a12.2963
  %t3400 = load i64, ptr %local.a13.2964
  %t3401 = load i64, ptr %local.a20.2965
  %t3402 = load i64, ptr %local.a21.2966
  %t3403 = load i64, ptr %local.a23.2967
  %t3404 = load i64, ptr %local.a30.2968
  %t3405 = load i64, ptr %local.a31.2969
  %t3406 = load i64, ptr %local.a32.2970
  %t3407 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.516)
  %t3408 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.517)
  %t3409 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.518)
  %t3410 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.519)
  %t3411 = load i64, ptr %local.inner_steps.2978
  %t3412 = call i64 @"meta_grad_one"(i64 %t3395, i64 %t3396, i64 %t3397, i64 %t3398, i64 %t3399, i64 %t3400, i64 %t3401, i64 %t3402, i64 %t3403, i64 %t3404, i64 %t3405, i64 %t3406, i64 %t3407, i64 %t3408, i64 %t3409, i64 %t3410, i64 10, i64 %t3411)
  store i64 %t3412, ptr %local.mg.2971
  %t3413 = load i64, ptr %local.a31.2969
  %t3414 = load i64, ptr %local.meta_lr.2977
  %t3415 = load i64, ptr %local.mg.2971
  %t3416 = call i64 @"sx_f64_mul"(i64 %t3414, i64 %t3415)
  %t3417 = call i64 @"sx_f64_sub"(i64 %t3413, i64 %t3416)
  %t3418 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.520)
  %t3419 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.521)
  %t3420 = call i64 @"clamp"(i64 %t3417, i64 %t3418, i64 %t3419)
  store i64 %t3420, ptr %local.a31.2969
  %t3421 = load i64, ptr %local.a01.2959
  %t3422 = load i64, ptr %local.a02.2960
  %t3423 = load i64, ptr %local.a03.2961
  %t3424 = load i64, ptr %local.a10.2962
  %t3425 = load i64, ptr %local.a12.2963
  %t3426 = load i64, ptr %local.a13.2964
  %t3427 = load i64, ptr %local.a20.2965
  %t3428 = load i64, ptr %local.a21.2966
  %t3429 = load i64, ptr %local.a23.2967
  %t3430 = load i64, ptr %local.a30.2968
  %t3431 = load i64, ptr %local.a31.2969
  %t3432 = load i64, ptr %local.a32.2970
  %t3433 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.522)
  %t3434 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.523)
  %t3435 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.524)
  %t3436 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.525)
  %t3437 = load i64, ptr %local.inner_steps.2978
  %t3438 = call i64 @"meta_grad_one"(i64 %t3421, i64 %t3422, i64 %t3423, i64 %t3424, i64 %t3425, i64 %t3426, i64 %t3427, i64 %t3428, i64 %t3429, i64 %t3430, i64 %t3431, i64 %t3432, i64 %t3433, i64 %t3434, i64 %t3435, i64 %t3436, i64 11, i64 %t3437)
  store i64 %t3438, ptr %local.mg.2971
  %t3439 = load i64, ptr %local.a32.2970
  %t3440 = load i64, ptr %local.meta_lr.2977
  %t3441 = load i64, ptr %local.mg.2971
  %t3442 = call i64 @"sx_f64_mul"(i64 %t3440, i64 %t3441)
  %t3443 = call i64 @"sx_f64_sub"(i64 %t3439, i64 %t3442)
  %t3444 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.526)
  %t3445 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.527)
  %t3446 = call i64 @"clamp"(i64 %t3443, i64 %t3444, i64 %t3445)
  store i64 %t3446, ptr %local.a32.2970
  %t3447 = load i64, ptr %local.a01.2959
  %t3448 = load i64, ptr %local.a02.2960
  %t3449 = load i64, ptr %local.a03.2961
  %t3450 = load i64, ptr %local.a10.2962
  %t3451 = load i64, ptr %local.a12.2963
  %t3452 = load i64, ptr %local.a13.2964
  %t3453 = load i64, ptr %local.a20.2965
  %t3454 = load i64, ptr %local.a21.2966
  %t3455 = load i64, ptr %local.a23.2967
  %t3456 = load i64, ptr %local.a30.2968
  %t3457 = load i64, ptr %local.a31.2969
  %t3458 = load i64, ptr %local.a32.2970
  %t3459 = load i64, ptr %local.l0_init.2980
  %t3460 = load i64, ptr %local.l1_init.2981
  %t3461 = load i64, ptr %local.l2_init.2982
  %t3462 = load i64, ptr %local.l3_init.2983
  %t3463 = load i64, ptr %local.inner_steps.2978
  %t3464 = call i64 @"compute_lyapunov"(i64 %t3447, i64 %t3448, i64 %t3449, i64 %t3450, i64 %t3451, i64 %t3452, i64 %t3453, i64 %t3454, i64 %t3455, i64 %t3456, i64 %t3457, i64 %t3458, i64 %t3459, i64 %t3460, i64 %t3461, i64 %t3462, i64 %t3463)
  store i64 %t3464, ptr %local.v_now.2975
  %t3465 = load i64, ptr %local.v_now.2975
  %t3466 = load i64, ptr %local.prev_v.2973
  %t3467 = call i64 @"sx_f64_sub"(i64 %t3465, i64 %t3466)
  %t3468 = call i64 @"abs_f64"(i64 %t3467)
  store i64 %t3468, ptr %local.score.2974
  %t3469 = load i64, ptr %local.score.2974
  %t3470 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.528)
  %t3471 = call i64 @"sx_f64_lt"(i64 %t3469, i64 %t3470)
  %t3472 = icmp ne i64 %t3471, 0
  br i1 %t3472, label %then91, label %else91
then91:
  %t3473 = load i64, ptr %local.crossed.2976
  %t3474 = icmp slt i64 %t3473, 1
  %t3475 = zext i1 %t3474 to i64
  %t3476 = icmp ne i64 %t3475, 0
  br i1 %t3476, label %then92, label %else92
then92:
  %t3477 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.529)
  %t3478 = ptrtoint ptr %t3477 to i64
  %t3479 = inttoptr i64 %t3478 to ptr
  call void @intrinsic_print(ptr %t3479)
  %t3480 = load i64, ptr %local.cycle.2972
  call void @print_i64(i64 %t3480)
  %t3481 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.530)
  %t3482 = ptrtoint ptr %t3481 to i64
  %t3483 = inttoptr i64 %t3482 to ptr
  call void @intrinsic_print(ptr %t3483)
  %t3484 = load i64, ptr %local.v_now.2975
  %t3485 = call i64 @"print_f64"(i64 %t3484)
  %t3486 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.531)
  %t3487 = ptrtoint ptr %t3486 to i64
  %t3488 = inttoptr i64 %t3487 to ptr
  call void @intrinsic_print(ptr %t3488)
  %t3489 = load i64, ptr %local.score.2974
  %t3490 = call i64 @"print_f64"(i64 %t3489)
  %t3491 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.532)
  %t3492 = ptrtoint ptr %t3491 to i64
  %t3493 = inttoptr i64 %t3492 to ptr
  call void @intrinsic_println(ptr %t3493)
  store i64 1, ptr %local.crossed.2976
  br label %then92_end
then92_end:
  br label %endif92
else92:
  br label %else92_end
else92_end:
  br label %endif92
endif92:
  %t3494 = phi i64 [ 0, %then92_end ], [ 0, %else92_end ]
  br label %then91_end
then91_end:
  br label %endif91
else91:
  br label %else91_end
else91_end:
  br label %endif91
endif91:
  %t3495 = phi i64 [ %t3494, %then91_end ], [ 0, %else91_end ]
  %t3496 = load i64, ptr %local.score.2974
  %t3497 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.533)
  %t3498 = call i64 @"sx_f64_lt"(i64 %t3496, i64 %t3497)
  %t3499 = icmp ne i64 %t3498, 0
  br i1 %t3499, label %then93, label %else93
then93:
  %t3500 = load i64, ptr %local.crossed.2976
  %t3501 = icmp slt i64 %t3500, 2
  %t3502 = zext i1 %t3501 to i64
  %t3503 = icmp ne i64 %t3502, 0
  br i1 %t3503, label %then94, label %else94
then94:
  %t3504 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.534)
  %t3505 = ptrtoint ptr %t3504 to i64
  %t3506 = inttoptr i64 %t3505 to ptr
  call void @intrinsic_print(ptr %t3506)
  %t3507 = load i64, ptr %local.cycle.2972
  call void @print_i64(i64 %t3507)
  %t3508 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.535)
  %t3509 = ptrtoint ptr %t3508 to i64
  %t3510 = inttoptr i64 %t3509 to ptr
  call void @intrinsic_print(ptr %t3510)
  %t3511 = load i64, ptr %local.v_now.2975
  %t3512 = call i64 @"print_f64"(i64 %t3511)
  %t3513 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.536)
  %t3514 = ptrtoint ptr %t3513 to i64
  %t3515 = inttoptr i64 %t3514 to ptr
  call void @intrinsic_print(ptr %t3515)
  %t3516 = load i64, ptr %local.score.2974
  %t3517 = call i64 @"print_f64"(i64 %t3516)
  %t3518 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.537)
  %t3519 = ptrtoint ptr %t3518 to i64
  %t3520 = inttoptr i64 %t3519 to ptr
  call void @intrinsic_println(ptr %t3520)
  store i64 2, ptr %local.crossed.2976
  br label %then94_end
then94_end:
  br label %endif94
else94:
  br label %else94_end
else94_end:
  br label %endif94
endif94:
  %t3521 = phi i64 [ 0, %then94_end ], [ 0, %else94_end ]
  br label %then93_end
then93_end:
  br label %endif93
else93:
  br label %else93_end
else93_end:
  br label %endif93
endif93:
  %t3522 = phi i64 [ %t3521, %then93_end ], [ 0, %else93_end ]
  %t3523 = load i64, ptr %local.score.2974
  %t3524 = call i64 @f64_parse(ptr @.str.exp_compiler_passes.538)
  %t3525 = call i64 @"sx_f64_lt"(i64 %t3523, i64 %t3524)
  %t3526 = icmp ne i64 %t3525, 0
  br i1 %t3526, label %then95, label %else95
then95:
  %t3527 = load i64, ptr %local.crossed.2976
  %t3528 = icmp slt i64 %t3527, 3
  %t3529 = zext i1 %t3528 to i64
  %t3530 = icmp ne i64 %t3529, 0
  br i1 %t3530, label %then96, label %else96
then96:
  %t3531 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.539)
  %t3532 = ptrtoint ptr %t3531 to i64
  %t3533 = inttoptr i64 %t3532 to ptr
  call void @intrinsic_print(ptr %t3533)
  %t3534 = load i64, ptr %local.cycle.2972
  call void @print_i64(i64 %t3534)
  %t3535 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.540)
  %t3536 = ptrtoint ptr %t3535 to i64
  %t3537 = inttoptr i64 %t3536 to ptr
  call void @intrinsic_print(ptr %t3537)
  %t3538 = load i64, ptr %local.v_now.2975
  %t3539 = call i64 @"print_f64"(i64 %t3538)
  %t3540 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.541)
  %t3541 = ptrtoint ptr %t3540 to i64
  %t3542 = inttoptr i64 %t3541 to ptr
  call void @intrinsic_print(ptr %t3542)
  %t3543 = load i64, ptr %local.score.2974
  %t3544 = call i64 @"print_f64"(i64 %t3543)
  %t3545 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.542)
  %t3546 = ptrtoint ptr %t3545 to i64
  %t3547 = inttoptr i64 %t3546 to ptr
  call void @intrinsic_println(ptr %t3547)
  store i64 3, ptr %local.crossed.2976
  br label %then96_end
then96_end:
  br label %endif96
else96:
  br label %else96_end
else96_end:
  br label %endif96
endif96:
  %t3548 = phi i64 [ 0, %then96_end ], [ 0, %else96_end ]
  br label %then95_end
then95_end:
  br label %endif95
else95:
  br label %else95_end
else95_end:
  br label %endif95
endif95:
  %t3549 = phi i64 [ %t3548, %then95_end ], [ 0, %else95_end ]
  %t3550 = load i64, ptr %local.cycle.2972
  %t3551 = icmp eq i64 %t3550, 0
  %t3552 = zext i1 %t3551 to i64
  %t3553 = icmp ne i64 %t3552, 0
  br i1 %t3553, label %then97, label %else97
then97:
  %t3554 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.543)
  %t3555 = ptrtoint ptr %t3554 to i64
  %t3556 = inttoptr i64 %t3555 to ptr
  call void @intrinsic_print(ptr %t3556)
  %t3557 = load i64, ptr %local.v_now.2975
  %t3558 = call i64 @"print_f64"(i64 %t3557)
  %t3559 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.544)
  %t3560 = ptrtoint ptr %t3559 to i64
  %t3561 = inttoptr i64 %t3560 to ptr
  call void @intrinsic_print(ptr %t3561)
  %t3562 = load i64, ptr %local.score.2974
  %t3563 = call i64 @"print_f64"(i64 %t3562)
  %t3564 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.545)
  %t3565 = ptrtoint ptr %t3564 to i64
  %t3566 = inttoptr i64 %t3565 to ptr
  call void @intrinsic_println(ptr %t3566)
  br label %then97_end
then97_end:
  br label %endif97
else97:
  br label %else97_end
else97_end:
  br label %endif97
endif97:
  %t3567 = phi i64 [ 0, %then97_end ], [ 0, %else97_end ]
  %t3568 = load i64, ptr %local.cycle.2972
  %t3569 = icmp eq i64 %t3568, 9
  %t3570 = zext i1 %t3569 to i64
  %t3571 = icmp ne i64 %t3570, 0
  br i1 %t3571, label %then98, label %else98
then98:
  %t3572 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.546)
  %t3573 = ptrtoint ptr %t3572 to i64
  %t3574 = inttoptr i64 %t3573 to ptr
  call void @intrinsic_print(ptr %t3574)
  %t3575 = load i64, ptr %local.v_now.2975
  %t3576 = call i64 @"print_f64"(i64 %t3575)
  %t3577 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.547)
  %t3578 = ptrtoint ptr %t3577 to i64
  %t3579 = inttoptr i64 %t3578 to ptr
  call void @intrinsic_print(ptr %t3579)
  %t3580 = load i64, ptr %local.score.2974
  %t3581 = call i64 @"print_f64"(i64 %t3580)
  %t3582 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.548)
  %t3583 = ptrtoint ptr %t3582 to i64
  %t3584 = inttoptr i64 %t3583 to ptr
  call void @intrinsic_println(ptr %t3584)
  br label %then98_end
then98_end:
  br label %endif98
else98:
  br label %else98_end
else98_end:
  br label %endif98
endif98:
  %t3585 = phi i64 [ 0, %then98_end ], [ 0, %else98_end ]
  %t3586 = load i64, ptr %local.cycle.2972
  %t3587 = icmp eq i64 %t3586, 19
  %t3588 = zext i1 %t3587 to i64
  %t3589 = icmp ne i64 %t3588, 0
  br i1 %t3589, label %then99, label %else99
then99:
  %t3590 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.549)
  %t3591 = ptrtoint ptr %t3590 to i64
  %t3592 = inttoptr i64 %t3591 to ptr
  call void @intrinsic_print(ptr %t3592)
  %t3593 = load i64, ptr %local.v_now.2975
  %t3594 = call i64 @"print_f64"(i64 %t3593)
  %t3595 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.550)
  %t3596 = ptrtoint ptr %t3595 to i64
  %t3597 = inttoptr i64 %t3596 to ptr
  call void @intrinsic_print(ptr %t3597)
  %t3598 = load i64, ptr %local.score.2974
  %t3599 = call i64 @"print_f64"(i64 %t3598)
  %t3600 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.551)
  %t3601 = ptrtoint ptr %t3600 to i64
  %t3602 = inttoptr i64 %t3601 to ptr
  call void @intrinsic_println(ptr %t3602)
  br label %then99_end
then99_end:
  br label %endif99
else99:
  br label %else99_end
else99_end:
  br label %endif99
endif99:
  %t3603 = phi i64 [ 0, %then99_end ], [ 0, %else99_end ]
  %t3604 = load i64, ptr %local.cycle.2972
  %t3605 = icmp eq i64 %t3604, 29
  %t3606 = zext i1 %t3605 to i64
  %t3607 = icmp ne i64 %t3606, 0
  br i1 %t3607, label %then100, label %else100
then100:
  %t3608 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.552)
  %t3609 = ptrtoint ptr %t3608 to i64
  %t3610 = inttoptr i64 %t3609 to ptr
  call void @intrinsic_print(ptr %t3610)
  %t3611 = load i64, ptr %local.v_now.2975
  %t3612 = call i64 @"print_f64"(i64 %t3611)
  %t3613 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.553)
  %t3614 = ptrtoint ptr %t3613 to i64
  %t3615 = inttoptr i64 %t3614 to ptr
  call void @intrinsic_print(ptr %t3615)
  %t3616 = load i64, ptr %local.score.2974
  %t3617 = call i64 @"print_f64"(i64 %t3616)
  %t3618 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.554)
  %t3619 = ptrtoint ptr %t3618 to i64
  %t3620 = inttoptr i64 %t3619 to ptr
  call void @intrinsic_println(ptr %t3620)
  br label %then100_end
then100_end:
  br label %endif100
else100:
  br label %else100_end
else100_end:
  br label %endif100
endif100:
  %t3621 = phi i64 [ 0, %then100_end ], [ 0, %else100_end ]
  %t3622 = load i64, ptr %local.cycle.2972
  %t3623 = icmp eq i64 %t3622, 39
  %t3624 = zext i1 %t3623 to i64
  %t3625 = icmp ne i64 %t3624, 0
  br i1 %t3625, label %then101, label %else101
then101:
  %t3626 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.555)
  %t3627 = ptrtoint ptr %t3626 to i64
  %t3628 = inttoptr i64 %t3627 to ptr
  call void @intrinsic_print(ptr %t3628)
  %t3629 = load i64, ptr %local.v_now.2975
  %t3630 = call i64 @"print_f64"(i64 %t3629)
  %t3631 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.556)
  %t3632 = ptrtoint ptr %t3631 to i64
  %t3633 = inttoptr i64 %t3632 to ptr
  call void @intrinsic_print(ptr %t3633)
  %t3634 = load i64, ptr %local.score.2974
  %t3635 = call i64 @"print_f64"(i64 %t3634)
  %t3636 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.557)
  %t3637 = ptrtoint ptr %t3636 to i64
  %t3638 = inttoptr i64 %t3637 to ptr
  call void @intrinsic_println(ptr %t3638)
  br label %then101_end
then101_end:
  br label %endif101
else101:
  br label %else101_end
else101_end:
  br label %endif101
endif101:
  %t3639 = phi i64 [ 0, %then101_end ], [ 0, %else101_end ]
  %t3640 = load i64, ptr %local.cycle.2972
  %t3641 = icmp eq i64 %t3640, 49
  %t3642 = zext i1 %t3641 to i64
  %t3643 = icmp ne i64 %t3642, 0
  br i1 %t3643, label %then102, label %else102
then102:
  %t3644 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.558)
  %t3645 = ptrtoint ptr %t3644 to i64
  %t3646 = inttoptr i64 %t3645 to ptr
  call void @intrinsic_print(ptr %t3646)
  %t3647 = load i64, ptr %local.v_now.2975
  %t3648 = call i64 @"print_f64"(i64 %t3647)
  %t3649 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.559)
  %t3650 = ptrtoint ptr %t3649 to i64
  %t3651 = inttoptr i64 %t3650 to ptr
  call void @intrinsic_print(ptr %t3651)
  %t3652 = load i64, ptr %local.score.2974
  %t3653 = call i64 @"print_f64"(i64 %t3652)
  %t3654 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.560)
  %t3655 = ptrtoint ptr %t3654 to i64
  %t3656 = inttoptr i64 %t3655 to ptr
  call void @intrinsic_println(ptr %t3656)
  br label %then102_end
then102_end:
  br label %endif102
else102:
  br label %else102_end
else102_end:
  br label %endif102
endif102:
  %t3657 = phi i64 [ 0, %then102_end ], [ 0, %else102_end ]
  %t3658 = load i64, ptr %local.v_now.2975
  store i64 %t3658, ptr %local.prev_v.2973
  %t3659 = load i64, ptr %local.cycle.2972
  %t3660 = add i64 %t3659, 1
  store i64 %t3660, ptr %local.cycle.2972
  br label %loop90
endloop90:
  %t3661 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.561)
  %t3662 = ptrtoint ptr %t3661 to i64
  %t3663 = inttoptr i64 %t3662 to ptr
  call void @intrinsic_println(ptr %t3663)
  %t3664 = load i64, ptr %local.crossed.2976
  %t3665 = icmp eq i64 %t3664, 3
  %t3666 = zext i1 %t3665 to i64
  %t3667 = icmp ne i64 %t3666, 0
  br i1 %t3667, label %then103, label %else103
then103:
  %t3668 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.562)
  %t3669 = ptrtoint ptr %t3668 to i64
  %t3670 = inttoptr i64 %t3669 to ptr
  call void @intrinsic_println(ptr %t3670)
  %t3671 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.563)
  %t3672 = ptrtoint ptr %t3671 to i64
  %t3673 = inttoptr i64 %t3672 to ptr
  call void @intrinsic_println(ptr %t3673)
  br label %then103_end
then103_end:
  br label %endif103
else103:
  %t3674 = load i64, ptr %local.crossed.2976
  %t3675 = icmp eq i64 %t3674, 2
  %t3676 = zext i1 %t3675 to i64
  %t3677 = icmp ne i64 %t3676, 0
  br i1 %t3677, label %then104, label %else104
then104:
  %t3678 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.564)
  %t3679 = ptrtoint ptr %t3678 to i64
  %t3680 = inttoptr i64 %t3679 to ptr
  call void @intrinsic_println(ptr %t3680)
  %t3681 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.565)
  %t3682 = ptrtoint ptr %t3681 to i64
  %t3683 = inttoptr i64 %t3682 to ptr
  call void @intrinsic_println(ptr %t3683)
  br label %then104_end
then104_end:
  br label %endif104
else104:
  %t3684 = load i64, ptr %local.crossed.2976
  %t3685 = icmp sge i64 %t3684, 1
  %t3686 = zext i1 %t3685 to i64
  %t3687 = icmp ne i64 %t3686, 0
  br i1 %t3687, label %then105, label %else105
then105:
  %t3688 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.566)
  %t3689 = ptrtoint ptr %t3688 to i64
  %t3690 = inttoptr i64 %t3689 to ptr
  call void @intrinsic_println(ptr %t3690)
  br label %then105_end
then105_end:
  br label %endif105
else105:
  %t3691 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.567)
  %t3692 = ptrtoint ptr %t3691 to i64
  %t3693 = inttoptr i64 %t3692 to ptr
  call void @intrinsic_println(ptr %t3693)
  br label %else105_end
else105_end:
  br label %endif105
endif105:
  %t3694 = phi i64 [ 0, %then105_end ], [ 0, %else105_end ]
  br label %else104_end
else104_end:
  br label %endif104
endif104:
  %t3695 = phi i64 [ 0, %then104_end ], [ %t3694, %else104_end ]
  br label %else103_end
else103_end:
  br label %endif103
endif103:
  %t3696 = phi i64 [ 0, %then103_end ], [ %t3695, %else103_end ]
  %t3697 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.568)
  %t3698 = ptrtoint ptr %t3697 to i64
  %t3699 = inttoptr i64 %t3698 to ptr
  call void @intrinsic_println(ptr %t3699)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.r1.3700 = alloca i64
  %local.r2.3701 = alloca i64
  %local.r3.3702 = alloca i64
  %t3703 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.569)
  %t3704 = ptrtoint ptr %t3703 to i64
  %t3705 = inttoptr i64 %t3704 to ptr
  call void @intrinsic_println(ptr %t3705)
  %t3706 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.570)
  %t3707 = ptrtoint ptr %t3706 to i64
  %t3708 = inttoptr i64 %t3707 to ptr
  call void @intrinsic_println(ptr %t3708)
  %t3709 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.571)
  %t3710 = ptrtoint ptr %t3709 to i64
  %t3711 = inttoptr i64 %t3710 to ptr
  call void @intrinsic_println(ptr %t3711)
  %t3712 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.572)
  %t3713 = ptrtoint ptr %t3712 to i64
  %t3714 = inttoptr i64 %t3713 to ptr
  call void @intrinsic_println(ptr %t3714)
  %t3715 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.573)
  %t3716 = ptrtoint ptr %t3715 to i64
  %t3717 = inttoptr i64 %t3716 to ptr
  call void @intrinsic_println(ptr %t3717)
  %t3718 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.574)
  %t3719 = ptrtoint ptr %t3718 to i64
  %t3720 = inttoptr i64 %t3719 to ptr
  call void @intrinsic_println(ptr %t3720)
  %t3721 = call i64 @"experiment_1"()
  store i64 %t3721, ptr %local.r1.3700
  %t3722 = call i64 @"experiment_2"()
  store i64 %t3722, ptr %local.r2.3701
  %t3723 = call i64 @"experiment_3"()
  store i64 %t3723, ptr %local.r3.3702
  %t3724 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.575)
  %t3725 = ptrtoint ptr %t3724 to i64
  %t3726 = inttoptr i64 %t3725 to ptr
  call void @intrinsic_println(ptr %t3726)
  %t3727 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.576)
  %t3728 = ptrtoint ptr %t3727 to i64
  %t3729 = inttoptr i64 %t3728 to ptr
  call void @intrinsic_println(ptr %t3729)
  %t3730 = call ptr @intrinsic_string_new(ptr @.str.exp_compiler_passes.577)
  %t3731 = ptrtoint ptr %t3730 to i64
  %t3732 = inttoptr i64 %t3731 to ptr
  call void @intrinsic_println(ptr %t3732)
  ret i64 0
}


; String constants
@.str.exp_compiler_passes.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.2 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_compiler_passes.3 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_compiler_passes.4 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_compiler_passes.5 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_compiler_passes.6 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.7 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.9 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.10 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.11 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.12 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_compiler_passes.13 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_compiler_passes.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.16 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.17 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.18 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.19 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.20 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.21 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.22 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.23 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.24 = private unnamed_addr constant [4 x i8] c"8.0\00"
@.str.exp_compiler_passes.25 = private unnamed_addr constant [4 x i8] c"8.0\00"
@.str.exp_compiler_passes.26 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_compiler_passes.27 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_compiler_passes.28 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_compiler_passes.29 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_compiler_passes.30 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.32 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.33 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_compiler_passes.34 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.35 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.40 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.41 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.43 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_compiler_passes.44 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.45 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.47 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.48 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.49 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.50 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.51 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.52 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.53 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.54 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.55 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.56 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.57 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.58 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.59 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.60 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.61 = private unnamed_addr constant [4 x i8] c"8.0\00"
@.str.exp_compiler_passes.62 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.63 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.64 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_compiler_passes.65 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.66 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_compiler_passes.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.68 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.69 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_compiler_passes.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.72 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.74 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.76 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.77 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.79 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.80 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.81 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_compiler_passes.82 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.83 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.89 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.92 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.93 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_compiler_passes.94 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_compiler_passes.95 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.96 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.97 = private unnamed_addr constant [4 x i8] c"  a\00"
@.str.exp_compiler_passes.98 = private unnamed_addr constant [2 x i8] c"=\00"
@.str.exp_compiler_passes.99 = private unnamed_addr constant [30 x i8] c"    Pass 0 (Inline):   [ --- \00"
@.str.exp_compiler_passes.100 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_compiler_passes.101 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_compiler_passes.102 = private unnamed_addr constant [3 x i8] c" ]\00"
@.str.exp_compiler_passes.103 = private unnamed_addr constant [26 x i8] c"    Pass 1 (Unroll):   [ \00"
@.str.exp_compiler_passes.104 = private unnamed_addr constant [7 x i8] c" ---  \00"
@.str.exp_compiler_passes.105 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_compiler_passes.106 = private unnamed_addr constant [3 x i8] c" ]\00"
@.str.exp_compiler_passes.107 = private unnamed_addr constant [26 x i8] c"    Pass 2 (ConstFld): [ \00"
@.str.exp_compiler_passes.108 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_compiler_passes.109 = private unnamed_addr constant [7 x i8] c" ---  \00"
@.str.exp_compiler_passes.110 = private unnamed_addr constant [3 x i8] c" ]\00"
@.str.exp_compiler_passes.111 = private unnamed_addr constant [26 x i8] c"    Pass 3 (SIMD):     [ \00"
@.str.exp_compiler_passes.112 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_compiler_passes.113 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_compiler_passes.114 = private unnamed_addr constant [8 x i8] c" ---  ]\00"
@.str.exp_compiler_passes.115 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.116 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.117 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.118 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.119 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.120 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.121 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.122 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.123 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.124 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.125 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.126 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.127 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.129 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_compiler_passes.130 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.131 = private unnamed_addr constant [40 x i8] c"  EXPERIMENT 1: Pass Interaction Matrix\00"
@.str.exp_compiler_passes.132 = private unnamed_addr constant [47 x i8] c"  4 compiler passes, 12 learnable alpha values\00"
@.str.exp_compiler_passes.133 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.134 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.135 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.136 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.137 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.138 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.139 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.140 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.141 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.142 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.145 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.147 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.148 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.149 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.150 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.151 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.152 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.153 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.154 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.156 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.157 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.158 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.159 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.160 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.161 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.162 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.163 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.164 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.165 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.166 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.167 = private unnamed_addr constant [30 x i8] c"  Baseline (no projection):  \00"
@.str.exp_compiler_passes.168 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.169 = private unnamed_addr constant [31 x i8] c"  Baseline (uniform alpha=1): \00"
@.str.exp_compiler_passes.170 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.171 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.172 = private unnamed_addr constant [33 x i8] c"  Training interaction matrix...\00"
@.str.exp_compiler_passes.173 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.174 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.175 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.176 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.177 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.178 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.179 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.180 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.181 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.182 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.183 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.184 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.185 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.186 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.187 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.188 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.189 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.190 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.191 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.192 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.193 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.194 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.195 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.196 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.197 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.198 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.199 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.200 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.201 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.202 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.203 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.204 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.205 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.206 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.207 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.208 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.209 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.210 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.211 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.212 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.213 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.214 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.215 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.216 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.217 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.218 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.219 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.220 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.221 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.222 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.223 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.224 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.225 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.226 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.227 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.228 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.229 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.230 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.231 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.232 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.233 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.234 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.235 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.236 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.237 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.238 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.239 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.240 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.241 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.242 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.243 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.244 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.245 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.246 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.247 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.248 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.249 = private unnamed_addr constant [20 x i8] c"    cycle  0  loss=\00"
@.str.exp_compiler_passes.250 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.251 = private unnamed_addr constant [20 x i8] c"    cycle 10  loss=\00"
@.str.exp_compiler_passes.252 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.253 = private unnamed_addr constant [20 x i8] c"    cycle 25  loss=\00"
@.str.exp_compiler_passes.254 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.255 = private unnamed_addr constant [20 x i8] c"    cycle 50  loss=\00"
@.str.exp_compiler_passes.256 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.257 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.258 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.259 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.260 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.261 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.262 = private unnamed_addr constant [41 x i8] c"  Learned Interaction Matrix (alpha_ij):\00"
@.str.exp_compiler_passes.263 = private unnamed_addr constant [54 x i8] c"  High alpha = high conflict, Low alpha = cooperative\00"
@.str.exp_compiler_passes.264 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.265 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.266 = private unnamed_addr constant [12 x i8] c"  Analysis:\00"
@.str.exp_compiler_passes.267 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.268 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.269 = private unnamed_addr constant [44 x i8] c"    Constant folding avg alpha (outgoing): \00"
@.str.exp_compiler_passes.270 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.271 = private unnamed_addr constant [44 x i8] c"    Constant folding avg alpha (incoming): \00"
@.str.exp_compiler_passes.272 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.273 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.274 = private unnamed_addr constant [44 x i8] c"    Inline<->Unroll avg alpha (conflict?): \00"
@.str.exp_compiler_passes.275 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.276 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.277 = private unnamed_addr constant [44 x i8] c"    Inline<->SIMD avg alpha:               \00"
@.str.exp_compiler_passes.278 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.279 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.280 = private unnamed_addr constant [25 x i8] c"  Final loss (learned): \00"
@.str.exp_compiler_passes.281 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.282 = private unnamed_addr constant [25 x i8] c"  Baseline (none):      \00"
@.str.exp_compiler_passes.283 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.284 = private unnamed_addr constant [25 x i8] c"  Baseline (uniform):   \00"
@.str.exp_compiler_passes.285 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.286 = private unnamed_addr constant [51 x i8] c"  PASS: Learned matrix improves over no projection\00"
@.str.exp_compiler_passes.287 = private unnamed_addr constant [58 x i8] c"  NOTE: Losses similar (passes may be mostly cooperative)\00"
@.str.exp_compiler_passes.288 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.289 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.290 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.291 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.292 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.293 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.294 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.295 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.296 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.297 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.298 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.299 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.300 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.301 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.302 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.303 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.304 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.305 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_compiler_passes.306 = private unnamed_addr constant [50 x i8] c"  --- Program A: Loop-heavy (bias unroll=3.0) ---\00"
@.str.exp_compiler_passes.307 = private unnamed_addr constant [50 x i8] c"  --- Program B: Call-heavy (bias inline=3.0) ---\00"
@.str.exp_compiler_passes.308 = private unnamed_addr constant [48 x i8] c"  --- Program C: Math-heavy (bias SIMD=3.0) ---\00"
@.str.exp_compiler_passes.309 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.310 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.311 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.312 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.313 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.314 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.315 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.316 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.317 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.318 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.319 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.320 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.321 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.322 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.323 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.324 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.325 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.326 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.327 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.328 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.329 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.330 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.331 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.332 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.333 = private unnamed_addr constant [17 x i8] c"    Final loss: \00"
@.str.exp_compiler_passes.334 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.335 = private unnamed_addr constant [20 x i8] c"    Learned matrix:\00"
@.str.exp_compiler_passes.336 = private unnamed_addr constant [25 x i8] c"    Max conflict alpha: \00"
@.str.exp_compiler_passes.337 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.338 = private unnamed_addr constant [25 x i8] c"    Min conflict alpha: \00"
@.str.exp_compiler_passes.339 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.340 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.341 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.342 = private unnamed_addr constant [39 x i8] c"  EXPERIMENT 2: Per-Program Adaptation\00"
@.str.exp_compiler_passes.343 = private unnamed_addr constant [47 x i8] c"  Same framework, 3 different program profiles\00"
@.str.exp_compiler_passes.344 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.345 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.346 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.347 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.348 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.349 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.350 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.351 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.352 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.353 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.354 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.355 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.356 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.357 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_compiler_passes.358 = private unnamed_addr constant [65 x i8] c"  If matrices differ, the framework adapts to program structure.\00"
@.str.exp_compiler_passes.359 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.360 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_compiler_passes.361 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_compiler_passes.362 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_compiler_passes.363 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_compiler_passes.364 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.365 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.366 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.367 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.368 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.369 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.370 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.371 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.372 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.373 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.374 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.375 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.376 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.377 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.378 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_compiler_passes.379 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.380 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_compiler_passes.381 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.382 = private unnamed_addr constant [43 x i8] c"  EXPERIMENT 3: Convergence-Based Stopping\00"
@.str.exp_compiler_passes.383 = private unnamed_addr constant [63 x i8] c"  Track normalised Lyapunov V = sum(Li/Li0) across meta-cycles\00"
@.str.exp_compiler_passes.384 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.385 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.386 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.387 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.388 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.389 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.390 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.391 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.392 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.393 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.394 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.395 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.396 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.397 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.398 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.399 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.400 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.401 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.402 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.403 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.404 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.405 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.406 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.407 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.408 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.409 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.410 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.411 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.412 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.413 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.414 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.415 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.416 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.417 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.418 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.419 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.420 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.421 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.422 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.423 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.424 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.425 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.426 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.427 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.428 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.429 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.430 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.431 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.432 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.433 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.434 = private unnamed_addr constant [31 x i8] c"  Initial per-pass losses: L0=\00"
@.str.exp_compiler_passes.435 = private unnamed_addr constant [6 x i8] c"  L1=\00"
@.str.exp_compiler_passes.436 = private unnamed_addr constant [6 x i8] c"  L2=\00"
@.str.exp_compiler_passes.437 = private unnamed_addr constant [6 x i8] c"  L3=\00"
@.str.exp_compiler_passes.438 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.439 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.440 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.441 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.442 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.443 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.444 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.445 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.446 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.447 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.448 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.449 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.450 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_compiler_passes.451 = private unnamed_addr constant [10 x i8] c"  V(0) = \00"
@.str.exp_compiler_passes.452 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.453 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.454 = private unnamed_addr constant [47 x i8] c"  Cycle   V(t)       S(t)=|dV/dt|   Thresholds\00"
@.str.exp_compiler_passes.455 = private unnamed_addr constant [47 x i8] c"  -----   ---------  ------------   ----------\00"
@.str.exp_compiler_passes.456 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.457 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.458 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.459 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.460 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.461 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.462 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.463 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.464 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.465 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.466 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.467 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.468 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.469 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.470 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.471 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.472 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.473 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.474 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.475 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.476 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.477 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.478 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.479 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.480 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.481 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.482 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.483 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.484 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.485 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.486 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.487 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.488 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.489 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.490 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.491 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.492 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.493 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.494 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.495 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.496 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.497 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.498 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.499 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.500 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.501 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.502 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.503 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.504 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.505 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.506 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.507 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.508 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.509 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.510 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.511 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.512 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.513 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.514 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.515 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.516 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.517 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.518 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.519 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.520 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.521 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.522 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.523 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.524 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.525 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_compiler_passes.526 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_compiler_passes.527 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_compiler_passes.528 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_compiler_passes.529 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.530 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_compiler_passes.531 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.532 = private unnamed_addr constant [17 x i8] c"   ** S < 0.1 **\00"
@.str.exp_compiler_passes.533 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_compiler_passes.534 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.535 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_compiler_passes.536 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.537 = private unnamed_addr constant [18 x i8] c"   ** S < 0.01 **\00"
@.str.exp_compiler_passes.538 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_compiler_passes.539 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.540 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_compiler_passes.541 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.542 = private unnamed_addr constant [19 x i8] c"   ** S < 0.001 **\00"
@.str.exp_compiler_passes.543 = private unnamed_addr constant [10 x i8] c"  0      \00"
@.str.exp_compiler_passes.544 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.545 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.546 = private unnamed_addr constant [10 x i8] c"  10     \00"
@.str.exp_compiler_passes.547 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.548 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.549 = private unnamed_addr constant [10 x i8] c"  20     \00"
@.str.exp_compiler_passes.550 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.551 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.552 = private unnamed_addr constant [10 x i8] c"  30     \00"
@.str.exp_compiler_passes.553 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.554 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.555 = private unnamed_addr constant [10 x i8] c"  40     \00"
@.str.exp_compiler_passes.556 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.557 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.558 = private unnamed_addr constant [10 x i8] c"  50     \00"
@.str.exp_compiler_passes.559 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_compiler_passes.560 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.561 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.562 = private unnamed_addr constant [53 x i8] c"  PASS: S(t) dropped below 0.001 -- system converged\00"
@.str.exp_compiler_passes.563 = private unnamed_addr constant [43 x i8] c"  Optimal pass iteration count identified.\00"
@.str.exp_compiler_passes.564 = private unnamed_addr constant [49 x i8] c"  PARTIAL: S(t) dropped below 0.01 but not 0.001\00"
@.str.exp_compiler_passes.565 = private unnamed_addr constant [47 x i8] c"  More meta-cycles may reach full convergence.\00"
@.str.exp_compiler_passes.566 = private unnamed_addr constant [39 x i8] c"  PARTIAL: S(t) dropped below 0.1 only\00"
@.str.exp_compiler_passes.567 = private unnamed_addr constant [53 x i8] c"  NOTE: S(t) did not converge below 0.1 in 50 cycles\00"
@.str.exp_compiler_passes.568 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.569 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.570 = private unnamed_addr constant [34 x i8] c"  GEOMETRIC CONTRACTION FRAMEWORK\00"
@.str.exp_compiler_passes.571 = private unnamed_addr constant [40 x i8] c"  Applied to Compiler Pass Optimisation\00"
@.str.exp_compiler_passes.572 = private unnamed_addr constant [39 x i8] c"  4 passes x 6D program representation\00"
@.str.exp_compiler_passes.573 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.574 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_compiler_passes.575 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_compiler_passes.576 = private unnamed_addr constant [27 x i8] c"  ALL EXPERIMENTS COMPLETE\00"
@.str.exp_compiler_passes.577 = private unnamed_addr constant [65 x i8] c"================================================================\00"
