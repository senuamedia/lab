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
  %t1 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"grad1"(i64 %theta) nounwind {
entry:
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t9 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.2)
  %t10 = load i64, ptr %local.theta
  %t11 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.3)
  %t12 = call i64 @"sx_f64_sub"(i64 %t10, i64 %t11)
  %t13 = call i64 @"sx_f64_mul"(i64 %t9, i64 %t12)
  ret i64 %t13
}

define i64 @"grad2"(i64 %theta) nounwind {
entry:
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t14 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.4)
  %t15 = load i64, ptr %local.theta
  %t16 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.5)
  %t17 = call i64 @"sx_f64_add"(i64 %t15, i64 %t16)
  %t18 = call i64 @"sx_f64_mul"(i64 %t14, i64 %t17)
  ret i64 %t18
}

define i64 @"interaction_at"(i64 %theta) nounwind {
entry:
  %local.g1.19 = alloca i64
  %local.g2.20 = alloca i64
  %local.n1.21 = alloca i64
  %local.n2.22 = alloca i64
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t23 = load i64, ptr %local.theta
  %t24 = call i64 @"grad1"(i64 %t23)
  store i64 %t24, ptr %local.g1.19
  %t25 = load i64, ptr %local.theta
  %t26 = call i64 @"grad2"(i64 %t25)
  store i64 %t26, ptr %local.g2.20
  %t27 = load i64, ptr %local.g1.19
  %t28 = call i64 @"abs_f64"(i64 %t27)
  store i64 %t28, ptr %local.n1.21
  %t29 = load i64, ptr %local.g2.20
  %t30 = call i64 @"abs_f64"(i64 %t29)
  store i64 %t30, ptr %local.n2.22
  %t31 = load i64, ptr %local.n1.21
  %t32 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.6)
  %t33 = call i64 @"sx_f64_lt"(i64 %t31, i64 %t32)
  %t34 = icmp ne i64 %t33, 0
  br i1 %t34, label %then1, label %else1
then1:
  %t35 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.7)
  ret i64 %t35
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t36 = phi i64 [ 0, %else1_end ]
  %t37 = load i64, ptr %local.n2.22
  %t38 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.8)
  %t39 = call i64 @"sx_f64_lt"(i64 %t37, i64 %t38)
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %then2, label %else2
then2:
  %t41 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.9)
  ret i64 %t41
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t42 = phi i64 [ 0, %else2_end ]
  %t43 = load i64, ptr %local.g1.19
  %t44 = load i64, ptr %local.g2.20
  %t45 = call i64 @"sx_f64_mul"(i64 %t43, i64 %t44)
  %t46 = load i64, ptr %local.n1.21
  %t47 = load i64, ptr %local.n2.22
  %t48 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t47)
  %t49 = call i64 @"sx_f64_div"(i64 %t45, i64 %t48)
  ret i64 %t49
}

define i64 @"dM_dtheta"(i64 %theta) nounwind {
entry:
  %local.h.50 = alloca i64
  %local.mp.51 = alloca i64
  %local.mm.52 = alloca i64
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t53 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.10)
  store i64 %t53, ptr %local.h.50
  %t54 = load i64, ptr %local.theta
  %t55 = load i64, ptr %local.h.50
  %t56 = call i64 @"sx_f64_add"(i64 %t54, i64 %t55)
  %t57 = call i64 @"interaction_at"(i64 %t56)
  store i64 %t57, ptr %local.mp.51
  %t58 = load i64, ptr %local.theta
  %t59 = load i64, ptr %local.h.50
  %t60 = call i64 @"sx_f64_sub"(i64 %t58, i64 %t59)
  %t61 = call i64 @"interaction_at"(i64 %t60)
  store i64 %t61, ptr %local.mm.52
  %t62 = load i64, ptr %local.mp.51
  %t63 = load i64, ptr %local.mm.52
  %t64 = call i64 @"sx_f64_sub"(i64 %t62, i64 %t63)
  %t65 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.11)
  %t66 = load i64, ptr %local.h.50
  %t67 = call i64 @"sx_f64_mul"(i64 %t65, i64 %t66)
  %t68 = call i64 @"sx_f64_div"(i64 %t64, i64 %t67)
  ret i64 %t68
}

define i64 @"d2M_dtheta2"(i64 %theta) nounwind {
entry:
  %local.h.69 = alloca i64
  %local.mp.70 = alloca i64
  %local.mm.71 = alloca i64
  %local.theta = alloca i64
  store i64 %theta, ptr %local.theta
  %t72 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.12)
  store i64 %t72, ptr %local.h.69
  %t73 = load i64, ptr %local.theta
  %t74 = load i64, ptr %local.h.69
  %t75 = call i64 @"sx_f64_add"(i64 %t73, i64 %t74)
  %t76 = call i64 @"dM_dtheta"(i64 %t75)
  store i64 %t76, ptr %local.mp.70
  %t77 = load i64, ptr %local.theta
  %t78 = load i64, ptr %local.h.69
  %t79 = call i64 @"sx_f64_sub"(i64 %t77, i64 %t78)
  %t80 = call i64 @"dM_dtheta"(i64 %t79)
  store i64 %t80, ptr %local.mm.71
  %t81 = load i64, ptr %local.mp.70
  %t82 = load i64, ptr %local.mm.71
  %t83 = call i64 @"sx_f64_sub"(i64 %t81, i64 %t82)
  %t84 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.13)
  %t85 = load i64, ptr %local.h.69
  %t86 = call i64 @"sx_f64_mul"(i64 %t84, i64 %t85)
  %t87 = call i64 @"sx_f64_div"(i64 %t83, i64 %t86)
  ret i64 %t87
}

define i64 @"test_1d_mapping"() nounwind {
entry:
  %local.theta.88 = alloca i64
  %local.best_theta.89 = alloca i64
  %local.min_dM.90 = alloca i64
  %local.m.91 = alloca i64
  %local.dm.92 = alloca i64
  %local.d2m.93 = alloca i64
  %local.adm.94 = alloca i64
  %local.adm.95 = alloca i64
  %local.d2m_at_eq.96 = alloca i64
  %local.x.97 = alloca i64
  %local.step.98 = alloca i64
  %local.g.99 = alloca i64
  %t100 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.14)
  %t101 = ptrtoint ptr %t100 to i64
  %t102 = inttoptr i64 %t101 to ptr
  call void @intrinsic_println(ptr %t102)
  %t103 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.15)
  %t104 = ptrtoint ptr %t103 to i64
  %t105 = inttoptr i64 %t104 to ptr
  call void @intrinsic_println(ptr %t105)
  %t106 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.16)
  %t107 = ptrtoint ptr %t106 to i64
  %t108 = inttoptr i64 %t107 to ptr
  call void @intrinsic_println(ptr %t108)
  %t109 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.17)
  %t110 = ptrtoint ptr %t109 to i64
  %t111 = inttoptr i64 %t110 to ptr
  call void @intrinsic_println(ptr %t111)
  %t112 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.18)
  %t113 = ptrtoint ptr %t112 to i64
  %t114 = inttoptr i64 %t113 to ptr
  call void @intrinsic_println(ptr %t114)
  %t115 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.19)
  %t116 = xor i64 %t115, -9223372036854775808
  store i64 %t116, ptr %local.theta.88
  %t117 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.20)
  store i64 %t117, ptr %local.best_theta.89
  %t118 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.21)
  store i64 %t118, ptr %local.min_dM.90
  br label %loop3
loop3:
  %t119 = load i64, ptr %local.theta.88
  %t120 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.22)
  %t121 = call i64 @"sx_f64_le"(i64 %t119, i64 %t120)
  %t122 = icmp ne i64 %t121, 0
  br i1 %t122, label %body3, label %endloop3
body3:
  %t123 = load i64, ptr %local.theta.88
  %t124 = call i64 @"interaction_at"(i64 %t123)
  store i64 %t124, ptr %local.m.91
  %t125 = load i64, ptr %local.theta.88
  %t126 = call i64 @"dM_dtheta"(i64 %t125)
  store i64 %t126, ptr %local.dm.92
  %t127 = load i64, ptr %local.theta.88
  %t128 = call i64 @"d2M_dtheta2"(i64 %t127)
  store i64 %t128, ptr %local.d2m.93
  %t129 = load i64, ptr %local.dm.92
  %t130 = call i64 @"abs_f64"(i64 %t129)
  store i64 %t130, ptr %local.adm.94
  %t131 = load i64, ptr %local.adm.94
  %t132 = load i64, ptr %local.min_dM.90
  %t133 = call i64 @"sx_f64_lt"(i64 %t131, i64 %t132)
  %t134 = icmp ne i64 %t133, 0
  br i1 %t134, label %then4, label %else4
then4:
  %t135 = load i64, ptr %local.adm.94
  store i64 %t135, ptr %local.min_dM.90
  %t136 = load i64, ptr %local.theta.88
  store i64 %t136, ptr %local.best_theta.89
  br label %then4_end
then4_end:
  br label %endif4
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t137 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t138 = load i64, ptr %local.theta.88
  %t139 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.23)
  %t140 = xor i64 %t139, -9223372036854775808
  %t141 = call i64 @"sx_f64_eq"(i64 %t138, i64 %t140)
  %t142 = icmp ne i64 %t141, 0
  br i1 %t142, label %then5, label %else5
then5:
  %t143 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.24)
  %t144 = ptrtoint ptr %t143 to i64
  %t145 = inttoptr i64 %t144 to ptr
  call void @intrinsic_print(ptr %t145)
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t146 = load i64, ptr %local.theta.88
  %t147 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.25)
  %t148 = xor i64 %t147, -9223372036854775808
  %t149 = call i64 @"sx_f64_eq"(i64 %t146, i64 %t148)
  %t150 = icmp ne i64 %t149, 0
  br i1 %t150, label %then6, label %else6
then6:
  %t151 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.26)
  %t152 = ptrtoint ptr %t151 to i64
  %t153 = inttoptr i64 %t152 to ptr
  call void @intrinsic_print(ptr %t153)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t154 = load i64, ptr %local.theta.88
  %t155 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.27)
  %t156 = call i64 @"sx_f64_eq"(i64 %t154, i64 %t155)
  %t157 = icmp ne i64 %t156, 0
  br i1 %t157, label %then7, label %else7
then7:
  %t158 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.28)
  %t159 = ptrtoint ptr %t158 to i64
  %t160 = inttoptr i64 %t159 to ptr
  call void @intrinsic_print(ptr %t160)
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t161 = load i64, ptr %local.theta.88
  %t162 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.29)
  %t163 = call i64 @"sx_f64_eq"(i64 %t161, i64 %t162)
  %t164 = icmp ne i64 %t163, 0
  br i1 %t164, label %then8, label %else8
then8:
  %t165 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.30)
  %t166 = ptrtoint ptr %t165 to i64
  %t167 = inttoptr i64 %t166 to ptr
  call void @intrinsic_print(ptr %t167)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t168 = load i64, ptr %local.theta.88
  %t169 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.31)
  %t170 = call i64 @"sx_f64_eq"(i64 %t168, i64 %t169)
  %t171 = icmp ne i64 %t170, 0
  br i1 %t171, label %then9, label %else9
then9:
  %t172 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.32)
  %t173 = ptrtoint ptr %t172 to i64
  %t174 = inttoptr i64 %t173 to ptr
  call void @intrinsic_print(ptr %t174)
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t175 = load i64, ptr %local.theta.88
  %t176 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.33)
  %t177 = call i64 @"sx_f64_eq"(i64 %t175, i64 %t176)
  %t178 = icmp ne i64 %t177, 0
  br i1 %t178, label %then10, label %else10
then10:
  %t179 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.34)
  %t180 = ptrtoint ptr %t179 to i64
  %t181 = inttoptr i64 %t180 to ptr
  call void @intrinsic_print(ptr %t181)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t182 = load i64, ptr %local.theta.88
  %t183 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.35)
  %t184 = call i64 @"sx_f64_eq"(i64 %t182, i64 %t183)
  %t185 = icmp ne i64 %t184, 0
  br i1 %t185, label %then11, label %else11
then11:
  %t186 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.36)
  %t187 = ptrtoint ptr %t186 to i64
  %t188 = inttoptr i64 %t187 to ptr
  call void @intrinsic_print(ptr %t188)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t189 = load i64, ptr %local.theta.88
  %t190 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.37)
  %t191 = call i64 @"sx_f64_add"(i64 %t189, i64 %t190)
  store i64 %t191, ptr %local.theta.88
  %t192 = load i64, ptr %local.theta.88
  store i64 %t192, ptr %local.theta.88
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t193 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t194 = phi i64 [ 0, %then10_end ], [ %t193, %else10_end ]
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t195 = phi i64 [ 0, %then9_end ], [ %t194, %else9_end ]
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t196 = phi i64 [ 0, %then8_end ], [ %t195, %else8_end ]
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t197 = phi i64 [ 0, %then7_end ], [ %t196, %else7_end ]
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t198 = phi i64 [ 0, %then6_end ], [ %t197, %else6_end ]
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t199 = phi i64 [ 0, %then5_end ], [ %t198, %else5_end ]
  %t200 = load i64, ptr %local.theta.88
  %t201 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.38)
  %t202 = xor i64 %t201, -9223372036854775808
  %t203 = call i64 @"sx_f64_eq"(i64 %t200, i64 %t202)
  %t204 = icmp ne i64 %t203, 0
  br i1 %t204, label %then12, label %else12
then12:
  %t205 = load i64, ptr %local.m.91
  %t206 = call i64 @"print_f64"(i64 %t205)
  %t207 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.39)
  %t208 = ptrtoint ptr %t207 to i64
  %t209 = inttoptr i64 %t208 to ptr
  call void @intrinsic_print(ptr %t209)
  %t210 = load i64, ptr %local.dm.92
  %t211 = call i64 @"print_f64"(i64 %t210)
  %t212 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.40)
  %t213 = ptrtoint ptr %t212 to i64
  %t214 = inttoptr i64 %t213 to ptr
  call void @intrinsic_print(ptr %t214)
  %t215 = load i64, ptr %local.d2m.93
  %t216 = call i64 @"print_f64"(i64 %t215)
  %t217 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.41)
  %t218 = ptrtoint ptr %t217 to i64
  %t219 = inttoptr i64 %t218 to ptr
  call void @intrinsic_println(ptr %t219)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t220 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t221 = load i64, ptr %local.theta.88
  %t222 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.42)
  %t223 = xor i64 %t222, -9223372036854775808
  %t224 = call i64 @"sx_f64_eq"(i64 %t221, i64 %t223)
  %t225 = icmp ne i64 %t224, 0
  br i1 %t225, label %then13, label %else13
then13:
  %t226 = load i64, ptr %local.m.91
  %t227 = call i64 @"print_f64"(i64 %t226)
  %t228 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.43)
  %t229 = ptrtoint ptr %t228 to i64
  %t230 = inttoptr i64 %t229 to ptr
  call void @intrinsic_print(ptr %t230)
  %t231 = load i64, ptr %local.dm.92
  %t232 = call i64 @"print_f64"(i64 %t231)
  %t233 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.44)
  %t234 = ptrtoint ptr %t233 to i64
  %t235 = inttoptr i64 %t234 to ptr
  call void @intrinsic_print(ptr %t235)
  %t236 = load i64, ptr %local.d2m.93
  %t237 = call i64 @"print_f64"(i64 %t236)
  %t238 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.45)
  %t239 = ptrtoint ptr %t238 to i64
  %t240 = inttoptr i64 %t239 to ptr
  call void @intrinsic_println(ptr %t240)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t241 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t242 = load i64, ptr %local.theta.88
  %t243 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.46)
  %t244 = call i64 @"sx_f64_eq"(i64 %t242, i64 %t243)
  %t245 = icmp ne i64 %t244, 0
  br i1 %t245, label %then14, label %else14
then14:
  %t246 = load i64, ptr %local.m.91
  %t247 = call i64 @"print_f64"(i64 %t246)
  %t248 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.47)
  %t249 = ptrtoint ptr %t248 to i64
  %t250 = inttoptr i64 %t249 to ptr
  call void @intrinsic_print(ptr %t250)
  %t251 = load i64, ptr %local.dm.92
  %t252 = call i64 @"print_f64"(i64 %t251)
  %t253 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.48)
  %t254 = ptrtoint ptr %t253 to i64
  %t255 = inttoptr i64 %t254 to ptr
  call void @intrinsic_print(ptr %t255)
  %t256 = load i64, ptr %local.d2m.93
  %t257 = call i64 @"print_f64"(i64 %t256)
  %t258 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.49)
  %t259 = ptrtoint ptr %t258 to i64
  %t260 = inttoptr i64 %t259 to ptr
  call void @intrinsic_println(ptr %t260)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t261 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t262 = load i64, ptr %local.theta.88
  %t263 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.50)
  %t264 = call i64 @"sx_f64_eq"(i64 %t262, i64 %t263)
  %t265 = icmp ne i64 %t264, 0
  br i1 %t265, label %then15, label %else15
then15:
  %t266 = load i64, ptr %local.m.91
  %t267 = call i64 @"print_f64"(i64 %t266)
  %t268 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.51)
  %t269 = ptrtoint ptr %t268 to i64
  %t270 = inttoptr i64 %t269 to ptr
  call void @intrinsic_print(ptr %t270)
  %t271 = load i64, ptr %local.dm.92
  %t272 = call i64 @"print_f64"(i64 %t271)
  %t273 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.52)
  %t274 = ptrtoint ptr %t273 to i64
  %t275 = inttoptr i64 %t274 to ptr
  call void @intrinsic_print(ptr %t275)
  %t276 = load i64, ptr %local.d2m.93
  %t277 = call i64 @"print_f64"(i64 %t276)
  %t278 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.53)
  %t279 = ptrtoint ptr %t278 to i64
  %t280 = inttoptr i64 %t279 to ptr
  call void @intrinsic_println(ptr %t280)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t281 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t282 = load i64, ptr %local.theta.88
  %t283 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.54)
  %t284 = call i64 @"sx_f64_eq"(i64 %t282, i64 %t283)
  %t285 = icmp ne i64 %t284, 0
  br i1 %t285, label %then16, label %else16
then16:
  %t286 = load i64, ptr %local.m.91
  %t287 = call i64 @"print_f64"(i64 %t286)
  %t288 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.55)
  %t289 = ptrtoint ptr %t288 to i64
  %t290 = inttoptr i64 %t289 to ptr
  call void @intrinsic_print(ptr %t290)
  %t291 = load i64, ptr %local.dm.92
  %t292 = call i64 @"print_f64"(i64 %t291)
  %t293 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.56)
  %t294 = ptrtoint ptr %t293 to i64
  %t295 = inttoptr i64 %t294 to ptr
  call void @intrinsic_print(ptr %t295)
  %t296 = load i64, ptr %local.d2m.93
  %t297 = call i64 @"print_f64"(i64 %t296)
  %t298 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.57)
  %t299 = ptrtoint ptr %t298 to i64
  %t300 = inttoptr i64 %t299 to ptr
  call void @intrinsic_println(ptr %t300)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t301 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t302 = load i64, ptr %local.theta.88
  %t303 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.58)
  %t304 = call i64 @"sx_f64_eq"(i64 %t302, i64 %t303)
  %t305 = icmp ne i64 %t304, 0
  br i1 %t305, label %then17, label %else17
then17:
  %t306 = load i64, ptr %local.m.91
  %t307 = call i64 @"print_f64"(i64 %t306)
  %t308 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.59)
  %t309 = ptrtoint ptr %t308 to i64
  %t310 = inttoptr i64 %t309 to ptr
  call void @intrinsic_print(ptr %t310)
  %t311 = load i64, ptr %local.dm.92
  %t312 = call i64 @"print_f64"(i64 %t311)
  %t313 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.60)
  %t314 = ptrtoint ptr %t313 to i64
  %t315 = inttoptr i64 %t314 to ptr
  call void @intrinsic_print(ptr %t315)
  %t316 = load i64, ptr %local.d2m.93
  %t317 = call i64 @"print_f64"(i64 %t316)
  %t318 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.61)
  %t319 = ptrtoint ptr %t318 to i64
  %t320 = inttoptr i64 %t319 to ptr
  call void @intrinsic_println(ptr %t320)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t321 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t322 = load i64, ptr %local.theta.88
  %t323 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.62)
  %t324 = call i64 @"sx_f64_eq"(i64 %t322, i64 %t323)
  %t325 = icmp ne i64 %t324, 0
  br i1 %t325, label %then18, label %else18
then18:
  %t326 = load i64, ptr %local.m.91
  %t327 = call i64 @"print_f64"(i64 %t326)
  %t328 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.63)
  %t329 = ptrtoint ptr %t328 to i64
  %t330 = inttoptr i64 %t329 to ptr
  call void @intrinsic_print(ptr %t330)
  %t331 = load i64, ptr %local.dm.92
  %t332 = call i64 @"print_f64"(i64 %t331)
  %t333 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.64)
  %t334 = ptrtoint ptr %t333 to i64
  %t335 = inttoptr i64 %t334 to ptr
  call void @intrinsic_print(ptr %t335)
  %t336 = load i64, ptr %local.d2m.93
  %t337 = call i64 @"print_f64"(i64 %t336)
  %t338 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.65)
  %t339 = ptrtoint ptr %t338 to i64
  %t340 = inttoptr i64 %t339 to ptr
  call void @intrinsic_println(ptr %t340)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t341 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t342 = load i64, ptr %local.theta.88
  %t343 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.66)
  %t344 = call i64 @"sx_f64_add"(i64 %t342, i64 %t343)
  store i64 %t344, ptr %local.theta.88
  br label %loop3
endloop3:
  %t345 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.67)
  %t346 = ptrtoint ptr %t345 to i64
  %t347 = inttoptr i64 %t346 to ptr
  call void @intrinsic_println(ptr %t347)
  %t348 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.68)
  %t349 = ptrtoint ptr %t348 to i64
  %t350 = inttoptr i64 %t349 to ptr
  call void @intrinsic_print(ptr %t350)
  %t351 = load i64, ptr %local.best_theta.89
  %t352 = call i64 @"print_f64"(i64 %t351)
  %t353 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.69)
  %t354 = ptrtoint ptr %t353 to i64
  %t355 = inttoptr i64 %t354 to ptr
  call void @intrinsic_print(ptr %t355)
  %t356 = load i64, ptr %local.min_dM.90
  %t357 = call i64 @"print_f64"(i64 %t356)
  %t358 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.70)
  %t359 = ptrtoint ptr %t358 to i64
  %t360 = inttoptr i64 %t359 to ptr
  call void @intrinsic_println(ptr %t360)
  %t361 = load i64, ptr %local.best_theta.89
  %t362 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.71)
  %t363 = call i64 @"sx_f64_sub"(i64 %t361, i64 %t362)
  store i64 %t363, ptr %local.theta.88
  %t364 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.72)
  store i64 %t364, ptr %local.min_dM.90
  br label %loop19
loop19:
  %t365 = load i64, ptr %local.theta.88
  %t366 = load i64, ptr %local.best_theta.89
  %t367 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.73)
  %t368 = call i64 @"sx_f64_add"(i64 %t366, i64 %t367)
  %t369 = call i64 @"sx_f64_le"(i64 %t365, i64 %t368)
  %t370 = icmp ne i64 %t369, 0
  br i1 %t370, label %body19, label %endloop19
body19:
  %t371 = load i64, ptr %local.theta.88
  %t372 = call i64 @"dM_dtheta"(i64 %t371)
  %t373 = call i64 @"abs_f64"(i64 %t372)
  store i64 %t373, ptr %local.adm.95
  %t374 = load i64, ptr %local.adm.95
  %t375 = load i64, ptr %local.min_dM.90
  %t376 = call i64 @"sx_f64_lt"(i64 %t374, i64 %t375)
  %t377 = icmp ne i64 %t376, 0
  br i1 %t377, label %then20, label %else20
then20:
  %t378 = load i64, ptr %local.adm.95
  store i64 %t378, ptr %local.min_dM.90
  %t379 = load i64, ptr %local.theta.88
  store i64 %t379, ptr %local.best_theta.89
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t380 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t381 = load i64, ptr %local.theta.88
  %t382 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.74)
  %t383 = call i64 @"sx_f64_add"(i64 %t381, i64 %t382)
  store i64 %t383, ptr %local.theta.88
  br label %loop19
endloop19:
  %t384 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.75)
  %t385 = ptrtoint ptr %t384 to i64
  %t386 = inttoptr i64 %t385 to ptr
  call void @intrinsic_print(ptr %t386)
  %t387 = load i64, ptr %local.best_theta.89
  %t388 = call i64 @"print_f64"(i64 %t387)
  %t389 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.76)
  %t390 = ptrtoint ptr %t389 to i64
  %t391 = inttoptr i64 %t390 to ptr
  call void @intrinsic_println(ptr %t391)
  %t392 = load i64, ptr %local.best_theta.89
  %t393 = call i64 @"d2M_dtheta2"(i64 %t392)
  store i64 %t393, ptr %local.d2m_at_eq.96
  %t394 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.77)
  %t395 = ptrtoint ptr %t394 to i64
  %t396 = inttoptr i64 %t395 to ptr
  call void @intrinsic_print(ptr %t396)
  %t397 = load i64, ptr %local.d2m_at_eq.96
  %t398 = call i64 @"print_f64"(i64 %t397)
  %t399 = load i64, ptr %local.d2m_at_eq.96
  %t400 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.78)
  %t401 = call i64 @"sx_f64_gt"(i64 %t399, i64 %t400)
  %t402 = icmp ne i64 %t401, 0
  br i1 %t402, label %then21, label %else21
then21:
  %t403 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.79)
  %t404 = ptrtoint ptr %t403 to i64
  %t405 = inttoptr i64 %t404 to ptr
  call void @intrinsic_println(ptr %t405)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t406 = load i64, ptr %local.d2m_at_eq.96
  %t407 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.80)
  %t408 = call i64 @"sx_f64_lt"(i64 %t406, i64 %t407)
  %t409 = icmp ne i64 %t408, 0
  br i1 %t409, label %then22, label %else22
then22:
  %t410 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.81)
  %t411 = ptrtoint ptr %t410 to i64
  %t412 = inttoptr i64 %t411 to ptr
  call void @intrinsic_println(ptr %t412)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  %t413 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.82)
  %t414 = ptrtoint ptr %t413 to i64
  %t415 = inttoptr i64 %t414 to ptr
  call void @intrinsic_println(ptr %t415)
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t416 = phi i64 [ 0, %then22_end ], [ 0, %else22_end ]
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t417 = phi i64 [ 0, %then21_end ], [ %t416, %else21_end ]
  %t418 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.83)
  store i64 %t418, ptr %local.x.97
  store i64 0, ptr %local.step.98
  br label %loop23
loop23:
  %t419 = load i64, ptr %local.step.98
  %t420 = icmp slt i64 %t419, 500
  %t421 = zext i1 %t420 to i64
  %t422 = icmp ne i64 %t421, 0
  br i1 %t422, label %body23, label %endloop23
body23:
  %t423 = load i64, ptr %local.x.97
  %t424 = call i64 @"grad1"(i64 %t423)
  %t425 = load i64, ptr %local.x.97
  %t426 = call i64 @"grad2"(i64 %t425)
  %t427 = call i64 @"sx_f64_add"(i64 %t424, i64 %t426)
  store i64 %t427, ptr %local.g.99
  %t428 = load i64, ptr %local.x.97
  %t429 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.84)
  %t430 = load i64, ptr %local.g.99
  %t431 = call i64 @"sx_f64_mul"(i64 %t429, i64 %t430)
  %t432 = call i64 @"sx_f64_sub"(i64 %t428, i64 %t431)
  store i64 %t432, ptr %local.x.97
  %t433 = load i64, ptr %local.step.98
  %t434 = add i64 %t433, 1
  store i64 %t434, ptr %local.step.98
  br label %loop23
endloop23:
  %t435 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.85)
  %t436 = ptrtoint ptr %t435 to i64
  %t437 = inttoptr i64 %t436 to ptr
  call void @intrinsic_print(ptr %t437)
  %t438 = load i64, ptr %local.x.97
  %t439 = call i64 @"print_f64"(i64 %t438)
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.86)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_println(ptr %t442)
  %t443 = load i64, ptr %local.best_theta.89
  %t444 = load i64, ptr %local.x.97
  %t445 = call i64 @"sx_f64_sub"(i64 %t443, i64 %t444)
  %t446 = call i64 @"abs_f64"(i64 %t445)
  %t447 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.87)
  %t448 = call i64 @"sx_f64_lt"(i64 %t446, i64 %t447)
  %t449 = icmp ne i64 %t448, 0
  br i1 %t449, label %then24, label %else24
then24:
  %t450 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.88)
  %t451 = ptrtoint ptr %t450 to i64
  %t452 = inttoptr i64 %t451 to ptr
  call void @intrinsic_println(ptr %t452)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.89)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_println(ptr %t455)
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t456 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t457 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.90)
  %t458 = ptrtoint ptr %t457 to i64
  %t459 = inttoptr i64 %t458 to ptr
  call void @intrinsic_println(ptr %t459)
  ret i64 0
}

define i64 @"interaction_norm_2d"(i64 %x, i64 %y) nounwind {
entry:
  %local.g1x.460 = alloca i64
  %local.g1y.461 = alloca i64
  %local.g2x.462 = alloca i64
  %local.g2y.463 = alloca i64
  %local.g3x.464 = alloca i64
  %local.g3y.465 = alloca i64
  %local.d12.466 = alloca i64
  %local.n1.467 = alloca i64
  %local.n2.468 = alloca i64
  %local.n3.469 = alloca i64
  %local.c12.470 = alloca i64
  %local.d13.471 = alloca i64
  %local.c13.472 = alloca i64
  %local.d23.473 = alloca i64
  %local.c23.474 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t475 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.91)
  %t476 = load i64, ptr %local.x
  %t477 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.92)
  %t478 = call i64 @"sx_f64_sub"(i64 %t476, i64 %t477)
  %t479 = call i64 @"sx_f64_mul"(i64 %t475, i64 %t478)
  store i64 %t479, ptr %local.g1x.460
  %t480 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.93)
  %t481 = load i64, ptr %local.y
  %t482 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.94)
  %t483 = call i64 @"sx_f64_sub"(i64 %t481, i64 %t482)
  %t484 = call i64 @"sx_f64_mul"(i64 %t480, i64 %t483)
  store i64 %t484, ptr %local.g1y.461
  %t485 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.95)
  %t486 = load i64, ptr %local.x
  %t487 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.96)
  %t488 = call i64 @"sx_f64_add"(i64 %t486, i64 %t487)
  %t489 = call i64 @"sx_f64_mul"(i64 %t485, i64 %t488)
  store i64 %t489, ptr %local.g2x.462
  %t490 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.97)
  %t491 = load i64, ptr %local.y
  %t492 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.98)
  %t493 = call i64 @"sx_f64_sub"(i64 %t491, i64 %t492)
  %t494 = call i64 @"sx_f64_mul"(i64 %t490, i64 %t493)
  store i64 %t494, ptr %local.g2y.463
  %t495 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.99)
  %t496 = load i64, ptr %local.x
  %t497 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.100)
  %t498 = call i64 @"sx_f64_sub"(i64 %t496, i64 %t497)
  %t499 = call i64 @"sx_f64_mul"(i64 %t495, i64 %t498)
  store i64 %t499, ptr %local.g3x.464
  %t500 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.101)
  %t501 = load i64, ptr %local.y
  %t502 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.102)
  %t503 = call i64 @"sx_f64_add"(i64 %t501, i64 %t502)
  %t504 = call i64 @"sx_f64_mul"(i64 %t500, i64 %t503)
  store i64 %t504, ptr %local.g3y.465
  %t505 = load i64, ptr %local.g1x.460
  %t506 = load i64, ptr %local.g2x.462
  %t507 = call i64 @"sx_f64_mul"(i64 %t505, i64 %t506)
  %t508 = load i64, ptr %local.g1y.461
  %t509 = load i64, ptr %local.g2y.463
  %t510 = call i64 @"sx_f64_mul"(i64 %t508, i64 %t509)
  %t511 = call i64 @"sx_f64_add"(i64 %t507, i64 %t510)
  store i64 %t511, ptr %local.d12.466
  %t512 = load i64, ptr %local.g1x.460
  %t513 = load i64, ptr %local.g1x.460
  %t514 = call i64 @"sx_f64_mul"(i64 %t512, i64 %t513)
  %t515 = load i64, ptr %local.g1y.461
  %t516 = load i64, ptr %local.g1y.461
  %t517 = call i64 @"sx_f64_mul"(i64 %t515, i64 %t516)
  %t518 = call i64 @"sx_f64_add"(i64 %t514, i64 %t517)
  %t519 = call i64 @"sqrt_f64"(i64 %t518)
  %t520 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.103)
  %t521 = call i64 @"sx_f64_add"(i64 %t519, i64 %t520)
  store i64 %t521, ptr %local.n1.467
  %t522 = load i64, ptr %local.g2x.462
  %t523 = load i64, ptr %local.g2x.462
  %t524 = call i64 @"sx_f64_mul"(i64 %t522, i64 %t523)
  %t525 = load i64, ptr %local.g2y.463
  %t526 = load i64, ptr %local.g2y.463
  %t527 = call i64 @"sx_f64_mul"(i64 %t525, i64 %t526)
  %t528 = call i64 @"sx_f64_add"(i64 %t524, i64 %t527)
  %t529 = call i64 @"sqrt_f64"(i64 %t528)
  %t530 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.104)
  %t531 = call i64 @"sx_f64_add"(i64 %t529, i64 %t530)
  store i64 %t531, ptr %local.n2.468
  %t532 = load i64, ptr %local.g3x.464
  %t533 = load i64, ptr %local.g3x.464
  %t534 = call i64 @"sx_f64_mul"(i64 %t532, i64 %t533)
  %t535 = load i64, ptr %local.g3y.465
  %t536 = load i64, ptr %local.g3y.465
  %t537 = call i64 @"sx_f64_mul"(i64 %t535, i64 %t536)
  %t538 = call i64 @"sx_f64_add"(i64 %t534, i64 %t537)
  %t539 = call i64 @"sqrt_f64"(i64 %t538)
  %t540 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.105)
  %t541 = call i64 @"sx_f64_add"(i64 %t539, i64 %t540)
  store i64 %t541, ptr %local.n3.469
  %t542 = load i64, ptr %local.d12.466
  %t543 = load i64, ptr %local.n1.467
  %t544 = load i64, ptr %local.n2.468
  %t545 = call i64 @"sx_f64_mul"(i64 %t543, i64 %t544)
  %t546 = call i64 @"sx_f64_div"(i64 %t542, i64 %t545)
  store i64 %t546, ptr %local.c12.470
  %t547 = load i64, ptr %local.g1x.460
  %t548 = load i64, ptr %local.g3x.464
  %t549 = call i64 @"sx_f64_mul"(i64 %t547, i64 %t548)
  %t550 = load i64, ptr %local.g1y.461
  %t551 = load i64, ptr %local.g3y.465
  %t552 = call i64 @"sx_f64_mul"(i64 %t550, i64 %t551)
  %t553 = call i64 @"sx_f64_add"(i64 %t549, i64 %t552)
  store i64 %t553, ptr %local.d13.471
  %t554 = load i64, ptr %local.d13.471
  %t555 = load i64, ptr %local.n1.467
  %t556 = load i64, ptr %local.n3.469
  %t557 = call i64 @"sx_f64_mul"(i64 %t555, i64 %t556)
  %t558 = call i64 @"sx_f64_div"(i64 %t554, i64 %t557)
  store i64 %t558, ptr %local.c13.472
  %t559 = load i64, ptr %local.g2x.462
  %t560 = load i64, ptr %local.g3x.464
  %t561 = call i64 @"sx_f64_mul"(i64 %t559, i64 %t560)
  %t562 = load i64, ptr %local.g2y.463
  %t563 = load i64, ptr %local.g3y.465
  %t564 = call i64 @"sx_f64_mul"(i64 %t562, i64 %t563)
  %t565 = call i64 @"sx_f64_add"(i64 %t561, i64 %t564)
  store i64 %t565, ptr %local.d23.473
  %t566 = load i64, ptr %local.d23.473
  %t567 = load i64, ptr %local.n2.468
  %t568 = load i64, ptr %local.n3.469
  %t569 = call i64 @"sx_f64_mul"(i64 %t567, i64 %t568)
  %t570 = call i64 @"sx_f64_div"(i64 %t566, i64 %t569)
  store i64 %t570, ptr %local.c23.474
  %t571 = load i64, ptr %local.c12.470
  %t572 = call i64 @"abs_f64"(i64 %t571)
  %t573 = load i64, ptr %local.c13.472
  %t574 = call i64 @"abs_f64"(i64 %t573)
  %t575 = call i64 @"sx_f64_add"(i64 %t572, i64 %t574)
  %t576 = load i64, ptr %local.c23.474
  %t577 = call i64 @"abs_f64"(i64 %t576)
  %t578 = call i64 @"sx_f64_add"(i64 %t575, i64 %t577)
  ret i64 %t578
}

define i64 @"dInorm_dx"(i64 %x, i64 %y) nounwind {
entry:
  %local.h.579 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t580 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.106)
  store i64 %t580, ptr %local.h.579
  %t581 = load i64, ptr %local.x
  %t582 = load i64, ptr %local.h.579
  %t583 = call i64 @"sx_f64_add"(i64 %t581, i64 %t582)
  %t584 = load i64, ptr %local.y
  %t585 = call i64 @"interaction_norm_2d"(i64 %t583, i64 %t584)
  %t586 = load i64, ptr %local.x
  %t587 = load i64, ptr %local.h.579
  %t588 = call i64 @"sx_f64_sub"(i64 %t586, i64 %t587)
  %t589 = load i64, ptr %local.y
  %t590 = call i64 @"interaction_norm_2d"(i64 %t588, i64 %t589)
  %t591 = call i64 @"sx_f64_sub"(i64 %t585, i64 %t590)
  %t592 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.107)
  %t593 = load i64, ptr %local.h.579
  %t594 = call i64 @"sx_f64_mul"(i64 %t592, i64 %t593)
  %t595 = call i64 @"sx_f64_div"(i64 %t591, i64 %t594)
  ret i64 %t595
}

define i64 @"dInorm_dy"(i64 %x, i64 %y) nounwind {
entry:
  %local.h.596 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.y = alloca i64
  store i64 %y, ptr %local.y
  %t597 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.108)
  store i64 %t597, ptr %local.h.596
  %t598 = load i64, ptr %local.x
  %t599 = load i64, ptr %local.y
  %t600 = load i64, ptr %local.h.596
  %t601 = call i64 @"sx_f64_add"(i64 %t599, i64 %t600)
  %t602 = call i64 @"interaction_norm_2d"(i64 %t598, i64 %t601)
  %t603 = load i64, ptr %local.x
  %t604 = load i64, ptr %local.y
  %t605 = load i64, ptr %local.h.596
  %t606 = call i64 @"sx_f64_sub"(i64 %t604, i64 %t605)
  %t607 = call i64 @"interaction_norm_2d"(i64 %t603, i64 %t606)
  %t608 = call i64 @"sx_f64_sub"(i64 %t602, i64 %t607)
  %t609 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.109)
  %t610 = load i64, ptr %local.h.596
  %t611 = call i64 @"sx_f64_mul"(i64 %t609, i64 %t610)
  %t612 = call i64 @"sx_f64_div"(i64 %t608, i64 %t611)
  ret i64 %t612
}

define i64 @"test_2d_mapping"() nounwind {
entry:
  %local.best_x.613 = alloca i64
  %local.best_y.614 = alloca i64
  %local.min_grad_norm.615 = alloca i64
  %local.ix.616 = alloca i64
  %local.iy.617 = alloca i64
  %local.dx.618 = alloca i64
  %local.dy.619 = alloca i64
  %local.grad_norm.620 = alloca i64
  %local.inorm.621 = alloca i64
  %local.ox.622 = alloca i64
  %local.oy.623 = alloca i64
  %local.step.624 = alloca i64
  %local.gx.625 = alloca i64
  %local.gy.626 = alloca i64
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.110)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_println(ptr %t629)
  %t630 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.111)
  %t631 = ptrtoint ptr %t630 to i64
  %t632 = inttoptr i64 %t631 to ptr
  call void @intrinsic_println(ptr %t632)
  %t633 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.112)
  %t634 = ptrtoint ptr %t633 to i64
  %t635 = inttoptr i64 %t634 to ptr
  call void @intrinsic_println(ptr %t635)
  %t636 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.113)
  %t637 = ptrtoint ptr %t636 to i64
  %t638 = inttoptr i64 %t637 to ptr
  call void @intrinsic_println(ptr %t638)
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.114)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_println(ptr %t641)
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.115)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_println(ptr %t644)
  %t645 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.116)
  store i64 %t645, ptr %local.best_x.613
  %t646 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.117)
  store i64 %t646, ptr %local.best_y.614
  %t647 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.118)
  store i64 %t647, ptr %local.min_grad_norm.615
  %t648 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.119)
  %t649 = ptrtoint ptr %t648 to i64
  %t650 = inttoptr i64 %t649 to ptr
  call void @intrinsic_println(ptr %t650)
  %t651 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.120)
  %t652 = xor i64 %t651, -9223372036854775808
  store i64 %t652, ptr %local.ix.616
  br label %loop25
loop25:
  %t653 = load i64, ptr %local.ix.616
  %t654 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.121)
  %t655 = call i64 @"sx_f64_le"(i64 %t653, i64 %t654)
  %t656 = icmp ne i64 %t655, 0
  br i1 %t656, label %body25, label %endloop25
body25:
  %t657 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.122)
  %t658 = xor i64 %t657, -9223372036854775808
  store i64 %t658, ptr %local.iy.617
  br label %loop26
loop26:
  %t659 = load i64, ptr %local.iy.617
  %t660 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.123)
  %t661 = call i64 @"sx_f64_le"(i64 %t659, i64 %t660)
  %t662 = icmp ne i64 %t661, 0
  br i1 %t662, label %body26, label %endloop26
body26:
  %t663 = load i64, ptr %local.ix.616
  %t664 = load i64, ptr %local.iy.617
  %t665 = call i64 @"dInorm_dx"(i64 %t663, i64 %t664)
  store i64 %t665, ptr %local.dx.618
  %t666 = load i64, ptr %local.ix.616
  %t667 = load i64, ptr %local.iy.617
  %t668 = call i64 @"dInorm_dy"(i64 %t666, i64 %t667)
  store i64 %t668, ptr %local.dy.619
  %t669 = load i64, ptr %local.dx.618
  %t670 = load i64, ptr %local.dx.618
  %t671 = call i64 @"sx_f64_mul"(i64 %t669, i64 %t670)
  %t672 = load i64, ptr %local.dy.619
  %t673 = load i64, ptr %local.dy.619
  %t674 = call i64 @"sx_f64_mul"(i64 %t672, i64 %t673)
  %t675 = call i64 @"sx_f64_add"(i64 %t671, i64 %t674)
  %t676 = call i64 @"sqrt_f64"(i64 %t675)
  store i64 %t676, ptr %local.grad_norm.620
  %t677 = load i64, ptr %local.ix.616
  %t678 = load i64, ptr %local.iy.617
  %t679 = call i64 @"interaction_norm_2d"(i64 %t677, i64 %t678)
  store i64 %t679, ptr %local.inorm.621
  %t680 = load i64, ptr %local.grad_norm.620
  %t681 = load i64, ptr %local.min_grad_norm.615
  %t682 = call i64 @"sx_f64_lt"(i64 %t680, i64 %t681)
  %t683 = icmp ne i64 %t682, 0
  br i1 %t683, label %then27, label %else27
then27:
  %t684 = load i64, ptr %local.grad_norm.620
  store i64 %t684, ptr %local.min_grad_norm.615
  %t685 = load i64, ptr %local.ix.616
  store i64 %t685, ptr %local.best_x.613
  %t686 = load i64, ptr %local.iy.617
  store i64 %t686, ptr %local.best_y.614
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t687 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t688 = load i64, ptr %local.ix.616
  %t689 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.124)
  %t690 = call i64 @"sx_f64_eq"(i64 %t688, i64 %t689)
  %t691 = icmp ne i64 %t690, 0
  br i1 %t691, label %then28, label %else28
then28:
  %t692 = load i64, ptr %local.iy.617
  %t693 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.125)
  %t694 = call i64 @"sx_f64_eq"(i64 %t692, i64 %t693)
  %t695 = icmp ne i64 %t694, 0
  br i1 %t695, label %then29, label %else29
then29:
  %t696 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.126)
  %t697 = ptrtoint ptr %t696 to i64
  %t698 = inttoptr i64 %t697 to ptr
  call void @intrinsic_print(ptr %t698)
  %t699 = load i64, ptr %local.grad_norm.620
  %t700 = call i64 @"print_f64"(i64 %t699)
  %t701 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.127)
  %t702 = ptrtoint ptr %t701 to i64
  %t703 = inttoptr i64 %t702 to ptr
  call void @intrinsic_print(ptr %t703)
  %t704 = load i64, ptr %local.inorm.621
  %t705 = call i64 @"print_f64"(i64 %t704)
  %t706 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.128)
  %t707 = ptrtoint ptr %t706 to i64
  %t708 = inttoptr i64 %t707 to ptr
  call void @intrinsic_println(ptr %t708)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t709 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t710 = phi i64 [ %t709, %then28_end ], [ 0, %else28_end ]
  %t711 = load i64, ptr %local.ix.616
  %t712 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.129)
  %t713 = call i64 @"sx_f64_eq"(i64 %t711, i64 %t712)
  %t714 = icmp ne i64 %t713, 0
  br i1 %t714, label %then30, label %else30
then30:
  %t715 = load i64, ptr %local.iy.617
  %t716 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.130)
  %t717 = call i64 @"sx_f64_eq"(i64 %t715, i64 %t716)
  %t718 = icmp ne i64 %t717, 0
  br i1 %t718, label %then31, label %else31
then31:
  %t719 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.131)
  %t720 = ptrtoint ptr %t719 to i64
  %t721 = inttoptr i64 %t720 to ptr
  call void @intrinsic_print(ptr %t721)
  %t722 = load i64, ptr %local.grad_norm.620
  %t723 = call i64 @"print_f64"(i64 %t722)
  %t724 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.132)
  %t725 = ptrtoint ptr %t724 to i64
  %t726 = inttoptr i64 %t725 to ptr
  call void @intrinsic_print(ptr %t726)
  %t727 = load i64, ptr %local.inorm.621
  %t728 = call i64 @"print_f64"(i64 %t727)
  %t729 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.133)
  %t730 = ptrtoint ptr %t729 to i64
  %t731 = inttoptr i64 %t730 to ptr
  call void @intrinsic_println(ptr %t731)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t732 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t733 = phi i64 [ %t732, %then30_end ], [ 0, %else30_end ]
  %t734 = load i64, ptr %local.ix.616
  %t735 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.134)
  %t736 = xor i64 %t735, -9223372036854775808
  %t737 = call i64 @"sx_f64_eq"(i64 %t734, i64 %t736)
  %t738 = icmp ne i64 %t737, 0
  br i1 %t738, label %then32, label %else32
then32:
  %t739 = load i64, ptr %local.iy.617
  %t740 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.135)
  %t741 = call i64 @"sx_f64_eq"(i64 %t739, i64 %t740)
  %t742 = icmp ne i64 %t741, 0
  br i1 %t742, label %then33, label %else33
then33:
  %t743 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.136)
  %t744 = ptrtoint ptr %t743 to i64
  %t745 = inttoptr i64 %t744 to ptr
  call void @intrinsic_print(ptr %t745)
  %t746 = load i64, ptr %local.grad_norm.620
  %t747 = call i64 @"print_f64"(i64 %t746)
  %t748 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.137)
  %t749 = ptrtoint ptr %t748 to i64
  %t750 = inttoptr i64 %t749 to ptr
  call void @intrinsic_print(ptr %t750)
  %t751 = load i64, ptr %local.inorm.621
  %t752 = call i64 @"print_f64"(i64 %t751)
  %t753 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.138)
  %t754 = ptrtoint ptr %t753 to i64
  %t755 = inttoptr i64 %t754 to ptr
  call void @intrinsic_println(ptr %t755)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t756 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t757 = phi i64 [ %t756, %then32_end ], [ 0, %else32_end ]
  %t758 = load i64, ptr %local.iy.617
  %t759 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.139)
  %t760 = call i64 @"sx_f64_add"(i64 %t758, i64 %t759)
  store i64 %t760, ptr %local.iy.617
  br label %loop26
endloop26:
  %t761 = load i64, ptr %local.ix.616
  %t762 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.140)
  %t763 = call i64 @"sx_f64_add"(i64 %t761, i64 %t762)
  store i64 %t763, ptr %local.ix.616
  br label %loop25
endloop25:
  %t764 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.141)
  %t765 = ptrtoint ptr %t764 to i64
  %t766 = inttoptr i64 %t765 to ptr
  call void @intrinsic_println(ptr %t766)
  %t767 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.142)
  %t768 = ptrtoint ptr %t767 to i64
  %t769 = inttoptr i64 %t768 to ptr
  call void @intrinsic_print(ptr %t769)
  %t770 = load i64, ptr %local.best_x.613
  %t771 = call i64 @"print_f64"(i64 %t770)
  %t772 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.143)
  %t773 = ptrtoint ptr %t772 to i64
  %t774 = inttoptr i64 %t773 to ptr
  call void @intrinsic_print(ptr %t774)
  %t775 = load i64, ptr %local.best_y.614
  %t776 = call i64 @"print_f64"(i64 %t775)
  %t777 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.144)
  %t778 = ptrtoint ptr %t777 to i64
  %t779 = inttoptr i64 %t778 to ptr
  call void @intrinsic_print(ptr %t779)
  %t780 = load i64, ptr %local.min_grad_norm.615
  %t781 = call i64 @"print_f64"(i64 %t780)
  %t782 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.145)
  %t783 = ptrtoint ptr %t782 to i64
  %t784 = inttoptr i64 %t783 to ptr
  call void @intrinsic_println(ptr %t784)
  %t785 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.146)
  store i64 %t785, ptr %local.ox.622
  %t786 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.147)
  store i64 %t786, ptr %local.oy.623
  store i64 0, ptr %local.step.624
  br label %loop34
loop34:
  %t787 = load i64, ptr %local.step.624
  %t788 = icmp slt i64 %t787, 500
  %t789 = zext i1 %t788 to i64
  %t790 = icmp ne i64 %t789, 0
  br i1 %t790, label %body34, label %endloop34
body34:
  %t791 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.148)
  %t792 = load i64, ptr %local.ox.622
  %t793 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.149)
  %t794 = call i64 @"sx_f64_sub"(i64 %t792, i64 %t793)
  %t795 = call i64 @"sx_f64_mul"(i64 %t791, i64 %t794)
  %t796 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.150)
  %t797 = load i64, ptr %local.ox.622
  %t798 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.151)
  %t799 = call i64 @"sx_f64_add"(i64 %t797, i64 %t798)
  %t800 = call i64 @"sx_f64_mul"(i64 %t796, i64 %t799)
  %t801 = call i64 @"sx_f64_add"(i64 %t795, i64 %t800)
  %t802 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.152)
  %t803 = load i64, ptr %local.ox.622
  %t804 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.153)
  %t805 = call i64 @"sx_f64_sub"(i64 %t803, i64 %t804)
  %t806 = call i64 @"sx_f64_mul"(i64 %t802, i64 %t805)
  %t807 = call i64 @"sx_f64_add"(i64 %t801, i64 %t806)
  store i64 %t807, ptr %local.gx.625
  %t808 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.154)
  %t809 = load i64, ptr %local.oy.623
  %t810 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.155)
  %t811 = call i64 @"sx_f64_sub"(i64 %t809, i64 %t810)
  %t812 = call i64 @"sx_f64_mul"(i64 %t808, i64 %t811)
  %t813 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.156)
  %t814 = load i64, ptr %local.oy.623
  %t815 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.157)
  %t816 = call i64 @"sx_f64_sub"(i64 %t814, i64 %t815)
  %t817 = call i64 @"sx_f64_mul"(i64 %t813, i64 %t816)
  %t818 = call i64 @"sx_f64_add"(i64 %t812, i64 %t817)
  %t819 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.158)
  %t820 = load i64, ptr %local.oy.623
  %t821 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.159)
  %t822 = call i64 @"sx_f64_add"(i64 %t820, i64 %t821)
  %t823 = call i64 @"sx_f64_mul"(i64 %t819, i64 %t822)
  %t824 = call i64 @"sx_f64_add"(i64 %t818, i64 %t823)
  store i64 %t824, ptr %local.gy.626
  %t825 = load i64, ptr %local.ox.622
  %t826 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.160)
  %t827 = load i64, ptr %local.gx.625
  %t828 = call i64 @"sx_f64_mul"(i64 %t826, i64 %t827)
  %t829 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.161)
  %t830 = call i64 @"sx_f64_div"(i64 %t828, i64 %t829)
  %t831 = call i64 @"sx_f64_sub"(i64 %t825, i64 %t830)
  store i64 %t831, ptr %local.ox.622
  %t832 = load i64, ptr %local.oy.623
  %t833 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.162)
  %t834 = load i64, ptr %local.gy.626
  %t835 = call i64 @"sx_f64_mul"(i64 %t833, i64 %t834)
  %t836 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.163)
  %t837 = call i64 @"sx_f64_div"(i64 %t835, i64 %t836)
  %t838 = call i64 @"sx_f64_sub"(i64 %t832, i64 %t837)
  store i64 %t838, ptr %local.oy.623
  %t839 = load i64, ptr %local.step.624
  %t840 = add i64 %t839, 1
  store i64 %t840, ptr %local.step.624
  br label %loop34
endloop34:
  %t841 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.164)
  %t842 = ptrtoint ptr %t841 to i64
  %t843 = inttoptr i64 %t842 to ptr
  call void @intrinsic_print(ptr %t843)
  %t844 = load i64, ptr %local.ox.622
  %t845 = call i64 @"print_f64"(i64 %t844)
  %t846 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.165)
  %t847 = ptrtoint ptr %t846 to i64
  %t848 = inttoptr i64 %t847 to ptr
  call void @intrinsic_print(ptr %t848)
  %t849 = load i64, ptr %local.oy.623
  %t850 = call i64 @"print_f64"(i64 %t849)
  %t851 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.166)
  %t852 = ptrtoint ptr %t851 to i64
  %t853 = inttoptr i64 %t852 to ptr
  call void @intrinsic_println(ptr %t853)
  %t854 = load i64, ptr %local.best_x.613
  %t855 = load i64, ptr %local.ox.622
  %t856 = call i64 @"sx_f64_sub"(i64 %t854, i64 %t855)
  %t857 = call i64 @"abs_f64"(i64 %t856)
  %t858 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.167)
  %t859 = call i64 @"sx_f64_lt"(i64 %t857, i64 %t858)
  %t860 = icmp ne i64 %t859, 0
  br i1 %t860, label %then35, label %else35
then35:
  %t861 = load i64, ptr %local.best_y.614
  %t862 = load i64, ptr %local.oy.623
  %t863 = call i64 @"sx_f64_sub"(i64 %t861, i64 %t862)
  %t864 = call i64 @"abs_f64"(i64 %t863)
  %t865 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.168)
  %t866 = call i64 @"sx_f64_lt"(i64 %t864, i64 %t865)
  %t867 = icmp ne i64 %t866, 0
  br i1 %t867, label %then36, label %else36
then36:
  %t868 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.169)
  %t869 = ptrtoint ptr %t868 to i64
  %t870 = inttoptr i64 %t869 to ptr
  call void @intrinsic_println(ptr %t870)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t871 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.170)
  %t872 = ptrtoint ptr %t871 to i64
  %t873 = inttoptr i64 %t872 to ptr
  call void @intrinsic_println(ptr %t873)
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t874 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t875 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.171)
  %t876 = ptrtoint ptr %t875 to i64
  %t877 = inttoptr i64 %t876 to ptr
  call void @intrinsic_println(ptr %t877)
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t878 = phi i64 [ %t874, %then35_end ], [ 0, %else35_end ]
  %t879 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.172)
  %t880 = ptrtoint ptr %t879 to i64
  %t881 = inttoptr i64 %t880 to ptr
  call void @intrinsic_println(ptr %t881)
  ret i64 0
}

define i64 @"test_interaction_flow"() nounwind {
entry:
  %local.lx.882 = alloca i64
  %local.ly.883 = alloca i64
  %local.step.884 = alloca i64
  %local.gx.885 = alloca i64
  %local.gy.886 = alloca i64
  %local.loss_x.887 = alloca i64
  %local.loss_y.888 = alloca i64
  %local.ix.889 = alloca i64
  %local.iy.890 = alloca i64
  %local.dx.891 = alloca i64
  %local.dy.892 = alloca i64
  %local.d_loss.893 = alloca i64
  %local.d_inter.894 = alloca i64
  %t895 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.173)
  %t896 = ptrtoint ptr %t895 to i64
  %t897 = inttoptr i64 %t896 to ptr
  call void @intrinsic_println(ptr %t897)
  %t898 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.174)
  %t899 = ptrtoint ptr %t898 to i64
  %t900 = inttoptr i64 %t899 to ptr
  call void @intrinsic_println(ptr %t900)
  %t901 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.175)
  %t902 = ptrtoint ptr %t901 to i64
  %t903 = inttoptr i64 %t902 to ptr
  call void @intrinsic_println(ptr %t903)
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.176)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_println(ptr %t906)
  %t907 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.177)
  %t908 = xor i64 %t907, -9223372036854775808
  store i64 %t908, ptr %local.lx.882
  %t909 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.178)
  %t910 = xor i64 %t909, -9223372036854775808
  store i64 %t910, ptr %local.ly.883
  store i64 0, ptr %local.step.884
  br label %loop37
loop37:
  %t911 = load i64, ptr %local.step.884
  %t912 = icmp slt i64 %t911, 200
  %t913 = zext i1 %t912 to i64
  %t914 = icmp ne i64 %t913, 0
  br i1 %t914, label %body37, label %endloop37
body37:
  %t915 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.179)
  %t916 = load i64, ptr %local.lx.882
  %t917 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.180)
  %t918 = call i64 @"sx_f64_sub"(i64 %t916, i64 %t917)
  %t919 = call i64 @"sx_f64_mul"(i64 %t915, i64 %t918)
  %t920 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.181)
  %t921 = load i64, ptr %local.lx.882
  %t922 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.182)
  %t923 = call i64 @"sx_f64_add"(i64 %t921, i64 %t922)
  %t924 = call i64 @"sx_f64_mul"(i64 %t920, i64 %t923)
  %t925 = call i64 @"sx_f64_add"(i64 %t919, i64 %t924)
  %t926 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.183)
  %t927 = load i64, ptr %local.lx.882
  %t928 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.184)
  %t929 = call i64 @"sx_f64_sub"(i64 %t927, i64 %t928)
  %t930 = call i64 @"sx_f64_mul"(i64 %t926, i64 %t929)
  %t931 = call i64 @"sx_f64_add"(i64 %t925, i64 %t930)
  store i64 %t931, ptr %local.gx.885
  %t932 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.185)
  %t933 = load i64, ptr %local.ly.883
  %t934 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.186)
  %t935 = call i64 @"sx_f64_sub"(i64 %t933, i64 %t934)
  %t936 = call i64 @"sx_f64_mul"(i64 %t932, i64 %t935)
  %t937 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.187)
  %t938 = load i64, ptr %local.ly.883
  %t939 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.188)
  %t940 = call i64 @"sx_f64_sub"(i64 %t938, i64 %t939)
  %t941 = call i64 @"sx_f64_mul"(i64 %t937, i64 %t940)
  %t942 = call i64 @"sx_f64_add"(i64 %t936, i64 %t941)
  %t943 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.189)
  %t944 = load i64, ptr %local.ly.883
  %t945 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.190)
  %t946 = call i64 @"sx_f64_add"(i64 %t944, i64 %t945)
  %t947 = call i64 @"sx_f64_mul"(i64 %t943, i64 %t946)
  %t948 = call i64 @"sx_f64_add"(i64 %t942, i64 %t947)
  store i64 %t948, ptr %local.gy.886
  %t949 = load i64, ptr %local.lx.882
  %t950 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.191)
  %t951 = load i64, ptr %local.gx.885
  %t952 = call i64 @"sx_f64_mul"(i64 %t950, i64 %t951)
  %t953 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.192)
  %t954 = call i64 @"sx_f64_div"(i64 %t952, i64 %t953)
  %t955 = call i64 @"sx_f64_sub"(i64 %t949, i64 %t954)
  store i64 %t955, ptr %local.lx.882
  %t956 = load i64, ptr %local.ly.883
  %t957 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.193)
  %t958 = load i64, ptr %local.gy.886
  %t959 = call i64 @"sx_f64_mul"(i64 %t957, i64 %t958)
  %t960 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.194)
  %t961 = call i64 @"sx_f64_div"(i64 %t959, i64 %t960)
  %t962 = call i64 @"sx_f64_sub"(i64 %t956, i64 %t961)
  store i64 %t962, ptr %local.ly.883
  %t963 = load i64, ptr %local.step.884
  %t964 = add i64 %t963, 1
  store i64 %t964, ptr %local.step.884
  br label %loop37
endloop37:
  %t965 = load i64, ptr %local.lx.882
  store i64 %t965, ptr %local.loss_x.887
  %t966 = load i64, ptr %local.ly.883
  store i64 %t966, ptr %local.loss_y.888
  %t967 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.195)
  %t968 = xor i64 %t967, -9223372036854775808
  store i64 %t968, ptr %local.ix.889
  %t969 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.196)
  %t970 = xor i64 %t969, -9223372036854775808
  store i64 %t970, ptr %local.iy.890
  store i64 0, ptr %local.step.884
  br label %loop38
loop38:
  %t971 = load i64, ptr %local.step.884
  %t972 = icmp slt i64 %t971, 200
  %t973 = zext i1 %t972 to i64
  %t974 = icmp ne i64 %t973, 0
  br i1 %t974, label %body38, label %endloop38
body38:
  %t975 = load i64, ptr %local.ix.889
  %t976 = load i64, ptr %local.iy.890
  %t977 = call i64 @"dInorm_dx"(i64 %t975, i64 %t976)
  store i64 %t977, ptr %local.dx.891
  %t978 = load i64, ptr %local.ix.889
  %t979 = load i64, ptr %local.iy.890
  %t980 = call i64 @"dInorm_dy"(i64 %t978, i64 %t979)
  store i64 %t980, ptr %local.dy.892
  %t981 = load i64, ptr %local.ix.889
  %t982 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.197)
  %t983 = load i64, ptr %local.dx.891
  %t984 = call i64 @"sx_f64_mul"(i64 %t982, i64 %t983)
  %t985 = call i64 @"sx_f64_sub"(i64 %t981, i64 %t984)
  store i64 %t985, ptr %local.ix.889
  %t986 = load i64, ptr %local.iy.890
  %t987 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.198)
  %t988 = load i64, ptr %local.dy.892
  %t989 = call i64 @"sx_f64_mul"(i64 %t987, i64 %t988)
  %t990 = call i64 @"sx_f64_sub"(i64 %t986, i64 %t989)
  store i64 %t990, ptr %local.iy.890
  %t991 = load i64, ptr %local.step.884
  %t992 = add i64 %t991, 1
  store i64 %t992, ptr %local.step.884
  br label %loop38
endloop38:
  %t993 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.199)
  %t994 = ptrtoint ptr %t993 to i64
  %t995 = inttoptr i64 %t994 to ptr
  call void @intrinsic_print(ptr %t995)
  %t996 = load i64, ptr %local.loss_x.887
  %t997 = call i64 @"print_f64"(i64 %t996)
  %t998 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.200)
  %t999 = ptrtoint ptr %t998 to i64
  %t1000 = inttoptr i64 %t999 to ptr
  call void @intrinsic_print(ptr %t1000)
  %t1001 = load i64, ptr %local.loss_y.888
  %t1002 = call i64 @"print_f64"(i64 %t1001)
  %t1003 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.201)
  %t1004 = ptrtoint ptr %t1003 to i64
  %t1005 = inttoptr i64 %t1004 to ptr
  call void @intrinsic_println(ptr %t1005)
  %t1006 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.202)
  %t1007 = ptrtoint ptr %t1006 to i64
  %t1008 = inttoptr i64 %t1007 to ptr
  call void @intrinsic_print(ptr %t1008)
  %t1009 = load i64, ptr %local.ix.889
  %t1010 = call i64 @"print_f64"(i64 %t1009)
  %t1011 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.203)
  %t1012 = ptrtoint ptr %t1011 to i64
  %t1013 = inttoptr i64 %t1012 to ptr
  call void @intrinsic_print(ptr %t1013)
  %t1014 = load i64, ptr %local.iy.890
  %t1015 = call i64 @"print_f64"(i64 %t1014)
  %t1016 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.204)
  %t1017 = ptrtoint ptr %t1016 to i64
  %t1018 = inttoptr i64 %t1017 to ptr
  call void @intrinsic_println(ptr %t1018)
  %t1019 = load i64, ptr %local.loss_x.887
  %t1020 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.205)
  %t1021 = call i64 @"sx_f64_sub"(i64 %t1019, i64 %t1020)
  %t1022 = load i64, ptr %local.loss_x.887
  %t1023 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.206)
  %t1024 = call i64 @"sx_f64_sub"(i64 %t1022, i64 %t1023)
  %t1025 = call i64 @"sx_f64_mul"(i64 %t1021, i64 %t1024)
  %t1026 = load i64, ptr %local.loss_y.888
  %t1027 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.207)
  %t1028 = call i64 @"sx_f64_sub"(i64 %t1026, i64 %t1027)
  %t1029 = load i64, ptr %local.loss_y.888
  %t1030 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.208)
  %t1031 = call i64 @"sx_f64_sub"(i64 %t1029, i64 %t1030)
  %t1032 = call i64 @"sx_f64_mul"(i64 %t1028, i64 %t1031)
  %t1033 = call i64 @"sx_f64_add"(i64 %t1025, i64 %t1032)
  %t1034 = call i64 @"sqrt_f64"(i64 %t1033)
  store i64 %t1034, ptr %local.d_loss.893
  %t1035 = load i64, ptr %local.ix.889
  %t1036 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.209)
  %t1037 = call i64 @"sx_f64_sub"(i64 %t1035, i64 %t1036)
  %t1038 = load i64, ptr %local.ix.889
  %t1039 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.210)
  %t1040 = call i64 @"sx_f64_sub"(i64 %t1038, i64 %t1039)
  %t1041 = call i64 @"sx_f64_mul"(i64 %t1037, i64 %t1040)
  %t1042 = load i64, ptr %local.iy.890
  %t1043 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.211)
  %t1044 = call i64 @"sx_f64_sub"(i64 %t1042, i64 %t1043)
  %t1045 = load i64, ptr %local.iy.890
  %t1046 = call i64 @f64_parse(ptr @.str.exp_equilibrium_mapping.212)
  %t1047 = call i64 @"sx_f64_sub"(i64 %t1045, i64 %t1046)
  %t1048 = call i64 @"sx_f64_mul"(i64 %t1044, i64 %t1047)
  %t1049 = call i64 @"sx_f64_add"(i64 %t1041, i64 %t1048)
  %t1050 = call i64 @"sqrt_f64"(i64 %t1049)
  store i64 %t1050, ptr %local.d_inter.894
  %t1051 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.213)
  %t1052 = ptrtoint ptr %t1051 to i64
  %t1053 = inttoptr i64 %t1052 to ptr
  call void @intrinsic_print(ptr %t1053)
  %t1054 = load i64, ptr %local.d_loss.893
  %t1055 = call i64 @"print_f64"(i64 %t1054)
  %t1056 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.214)
  %t1057 = ptrtoint ptr %t1056 to i64
  %t1058 = inttoptr i64 %t1057 to ptr
  call void @intrinsic_println(ptr %t1058)
  %t1059 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.215)
  %t1060 = ptrtoint ptr %t1059 to i64
  %t1061 = inttoptr i64 %t1060 to ptr
  call void @intrinsic_print(ptr %t1061)
  %t1062 = load i64, ptr %local.d_inter.894
  %t1063 = call i64 @"print_f64"(i64 %t1062)
  %t1064 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.216)
  %t1065 = ptrtoint ptr %t1064 to i64
  %t1066 = inttoptr i64 %t1065 to ptr
  call void @intrinsic_println(ptr %t1066)
  %t1067 = load i64, ptr %local.d_inter.894
  %t1068 = load i64, ptr %local.d_loss.893
  %t1069 = call i64 @"sx_f64_lt"(i64 %t1067, i64 %t1068)
  %t1070 = icmp ne i64 %t1069, 0
  br i1 %t1070, label %then39, label %else39
then39:
  %t1071 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.217)
  %t1072 = ptrtoint ptr %t1071 to i64
  %t1073 = inttoptr i64 %t1072 to ptr
  call void @intrinsic_println(ptr %t1073)
  %t1074 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.218)
  %t1075 = ptrtoint ptr %t1074 to i64
  %t1076 = inttoptr i64 %t1075 to ptr
  call void @intrinsic_println(ptr %t1076)
  %t1077 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.219)
  %t1078 = ptrtoint ptr %t1077 to i64
  %t1079 = inttoptr i64 %t1078 to ptr
  call void @intrinsic_println(ptr %t1079)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  %t1080 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.220)
  %t1081 = ptrtoint ptr %t1080 to i64
  %t1082 = inttoptr i64 %t1081 to ptr
  call void @intrinsic_println(ptr %t1082)
  %t1083 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.221)
  %t1084 = ptrtoint ptr %t1083 to i64
  %t1085 = inttoptr i64 %t1084 to ptr
  call void @intrinsic_println(ptr %t1085)
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1086 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1087 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.222)
  %t1088 = ptrtoint ptr %t1087 to i64
  %t1089 = inttoptr i64 %t1088 to ptr
  call void @intrinsic_println(ptr %t1089)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1090 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.223)
  %t1091 = ptrtoint ptr %t1090 to i64
  %t1092 = inttoptr i64 %t1091 to ptr
  call void @intrinsic_println(ptr %t1092)
  %t1093 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.224)
  %t1094 = ptrtoint ptr %t1093 to i64
  %t1095 = inttoptr i64 %t1094 to ptr
  call void @intrinsic_println(ptr %t1095)
  %t1096 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.225)
  %t1097 = ptrtoint ptr %t1096 to i64
  %t1098 = inttoptr i64 %t1097 to ptr
  call void @intrinsic_println(ptr %t1098)
  %t1099 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.226)
  %t1100 = ptrtoint ptr %t1099 to i64
  %t1101 = inttoptr i64 %t1100 to ptr
  call void @intrinsic_println(ptr %t1101)
  %t1102 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.227)
  %t1103 = ptrtoint ptr %t1102 to i64
  %t1104 = inttoptr i64 %t1103 to ptr
  call void @intrinsic_println(ptr %t1104)
  %t1105 = call i64 @"test_1d_mapping"()
  %t1106 = call i64 @"test_2d_mapping"()
  %t1107 = call i64 @"test_interaction_flow"()
  %t1108 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.228)
  %t1109 = ptrtoint ptr %t1108 to i64
  %t1110 = inttoptr i64 %t1109 to ptr
  call void @intrinsic_println(ptr %t1110)
  %t1111 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.229)
  %t1112 = ptrtoint ptr %t1111 to i64
  %t1113 = inttoptr i64 %t1112 to ptr
  call void @intrinsic_println(ptr %t1113)
  %t1114 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.230)
  %t1115 = ptrtoint ptr %t1114 to i64
  %t1116 = inttoptr i64 %t1115 to ptr
  call void @intrinsic_println(ptr %t1116)
  %t1117 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.231)
  %t1118 = ptrtoint ptr %t1117 to i64
  %t1119 = inttoptr i64 %t1118 to ptr
  call void @intrinsic_println(ptr %t1119)
  %t1120 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.232)
  %t1121 = ptrtoint ptr %t1120 to i64
  %t1122 = inttoptr i64 %t1121 to ptr
  call void @intrinsic_println(ptr %t1122)
  %t1123 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.233)
  %t1124 = ptrtoint ptr %t1123 to i64
  %t1125 = inttoptr i64 %t1124 to ptr
  call void @intrinsic_println(ptr %t1125)
  %t1126 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.234)
  %t1127 = ptrtoint ptr %t1126 to i64
  %t1128 = inttoptr i64 %t1127 to ptr
  call void @intrinsic_println(ptr %t1128)
  %t1129 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.235)
  %t1130 = ptrtoint ptr %t1129 to i64
  %t1131 = inttoptr i64 %t1130 to ptr
  call void @intrinsic_println(ptr %t1131)
  %t1132 = call ptr @intrinsic_string_new(ptr @.str.exp_equilibrium_mapping.236)
  %t1133 = ptrtoint ptr %t1132 to i64
  %t1134 = inttoptr i64 %t1133 to ptr
  call void @intrinsic_println(ptr %t1134)
  ret i64 0
}


; String constants
@.str.exp_equilibrium_mapping.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.3 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.6 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_equilibrium_mapping.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.8 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_equilibrium_mapping.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.10 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_equilibrium_mapping.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.12 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_equilibrium_mapping.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.14 = private unnamed_addr constant [38 x i8] c"--- Exp 1: 1D Equilibrium Mapping ---\00"
@.str.exp_equilibrium_mapping.15 = private unnamed_addr constant [31 x i8] c"  L1 = (θ-3)², L2 = (θ+2)²\00"
@.str.exp_equilibrium_mapping.16 = private unnamed_addr constant [30 x i8] c"  True equilibrium: θ* = 0.5\00"
@.str.exp_equilibrium_mapping.17 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.18 = private unnamed_addr constant [54 x i8] c"  θ       M(θ)       dM/dθ      d²M/dθ²    Type\00"
@.str.exp_equilibrium_mapping.19 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.21 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_equilibrium_mapping.22 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_equilibrium_mapping.23 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.24 = private unnamed_addr constant [11 x i8] c"  -4.0    \00"
@.str.exp_equilibrium_mapping.25 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.26 = private unnamed_addr constant [11 x i8] c"  -2.0    \00"
@.str.exp_equilibrium_mapping.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.28 = private unnamed_addr constant [11 x i8] c"   0.0    \00"
@.str.exp_equilibrium_mapping.29 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_equilibrium_mapping.30 = private unnamed_addr constant [11 x i8] c"   0.5    \00"
@.str.exp_equilibrium_mapping.31 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.32 = private unnamed_addr constant [11 x i8] c"   1.0    \00"
@.str.exp_equilibrium_mapping.33 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.34 = private unnamed_addr constant [11 x i8] c"   3.0    \00"
@.str.exp_equilibrium_mapping.35 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_equilibrium_mapping.36 = private unnamed_addr constant [11 x i8] c"   5.0    \00"
@.str.exp_equilibrium_mapping.37 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_equilibrium_mapping.38 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.39 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.40 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.41 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.43 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.44 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.45 = private unnamed_addr constant [15 x i8] c"  <- L2 target\00"
@.str.exp_equilibrium_mapping.46 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.47 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.48 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.49 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.50 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_equilibrium_mapping.51 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.52 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.53 = private unnamed_addr constant [18 x i8] c"  <- predicted eq\00"
@.str.exp_equilibrium_mapping.54 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.55 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.56 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.57 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.58 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.59 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.60 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.61 = private unnamed_addr constant [15 x i8] c"  <- L1 target\00"
@.str.exp_equilibrium_mapping.62 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_equilibrium_mapping.63 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.64 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.65 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.66 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_equilibrium_mapping.67 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.68 = private unnamed_addr constant [28 x i8] c"  Minimum |dM/dθ| at θ = \00"
@.str.exp_equilibrium_mapping.69 = private unnamed_addr constant [11 x i8] c"  (|dM| = \00"
@.str.exp_equilibrium_mapping.70 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_equilibrium_mapping.71 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.72 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_equilibrium_mapping.73 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.74 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_equilibrium_mapping.75 = private unnamed_addr constant [20 x i8] c"  Refined: θ* ≈ \00"
@.str.exp_equilibrium_mapping.76 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.77 = private unnamed_addr constant [23 x i8] c"  d²M/dθ² at θ* = \00"
@.str.exp_equilibrium_mapping.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.79 = private unnamed_addr constant [12 x i8] c"  ATTRACTOR\00"
@.str.exp_equilibrium_mapping.80 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.81 = private unnamed_addr constant [9 x i8] c"  SADDLE\00"
@.str.exp_equilibrium_mapping.82 = private unnamed_addr constant [13 x i8] c"  DEGENERATE\00"
@.str.exp_equilibrium_mapping.83 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.84 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_equilibrium_mapping.85 = private unnamed_addr constant [41 x i8] c"  Actual optimization converges to θ = \00"
@.str.exp_equilibrium_mapping.86 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.87 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_equilibrium_mapping.88 = private unnamed_addr constant [62 x i8] c"  MATCH: Predicted equilibrium agrees with actual convergence\00"
@.str.exp_equilibrium_mapping.89 = private unnamed_addr constant [11 x i8] c"  MISMATCH\00"
@.str.exp_equilibrium_mapping.90 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.92 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.93 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.94 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.95 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.96 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.97 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.98 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.99 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.100 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.101 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.102 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.103 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_equilibrium_mapping.104 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_equilibrium_mapping.105 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_equilibrium_mapping.106 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_equilibrium_mapping.107 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.108 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_equilibrium_mapping.109 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.110 = private unnamed_addr constant [34 x i8] c"--- Exp 2: 2D Equilibrium Map ---\00"
@.str.exp_equilibrium_mapping.111 = private unnamed_addr constant [38 x i8] c"  3 objectives: (3,1), (-1,4), (1,-2)\00"
@.str.exp_equilibrium_mapping.112 = private unnamed_addr constant [38 x i8] c"  True equilibrium: mean = (1.0, 1.0)\00"
@.str.exp_equilibrium_mapping.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.114 = private unnamed_addr constant [55 x i8] c"  Map ||dM/dθ|| across grid — minimum = equilibrium\00"
@.str.exp_equilibrium_mapping.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.116 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.117 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.118 = private unnamed_addr constant [6 x i8] c"999.0\00"
@.str.exp_equilibrium_mapping.119 = private unnamed_addr constant [34 x i8] c"  x     y     ||∇M||     I_norm\00"
@.str.exp_equilibrium_mapping.120 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.121 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.122 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.123 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_equilibrium_mapping.124 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.125 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.126 = private unnamed_addr constant [15 x i8] c"  1.0   1.0   \00"
@.str.exp_equilibrium_mapping.127 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.128 = private unnamed_addr constant [18 x i8] c"  <- predicted eq\00"
@.str.exp_equilibrium_mapping.129 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.130 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.131 = private unnamed_addr constant [15 x i8] c"  3.0   1.0   \00"
@.str.exp_equilibrium_mapping.132 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.133 = private unnamed_addr constant [15 x i8] c"  <- L1 target\00"
@.str.exp_equilibrium_mapping.134 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.135 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.136 = private unnamed_addr constant [15 x i8] c"  -1.0  4.0   \00"
@.str.exp_equilibrium_mapping.137 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_equilibrium_mapping.138 = private unnamed_addr constant [15 x i8] c"  <- L2 target\00"
@.str.exp_equilibrium_mapping.139 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.140 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.142 = private unnamed_addr constant [24 x i8] c"  Minimum ||∇M|| at (\00"
@.str.exp_equilibrium_mapping.143 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_equilibrium_mapping.144 = private unnamed_addr constant [13 x i8] c")  ||∇M||=\00"
@.str.exp_equilibrium_mapping.145 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.147 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_equilibrium_mapping.148 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.149 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.150 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.151 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.152 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.153 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.154 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.156 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.157 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.158 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.159 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.160 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_equilibrium_mapping.161 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.162 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_equilibrium_mapping.163 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.164 = private unnamed_addr constant [24 x i8] c"  Actual convergence: (\00"
@.str.exp_equilibrium_mapping.165 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_equilibrium_mapping.166 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_equilibrium_mapping.167 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_equilibrium_mapping.168 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_equilibrium_mapping.169 = private unnamed_addr constant [54 x i8] c"  MATCH: Structural stationarity predicts equilibrium\00"
@.str.exp_equilibrium_mapping.170 = private unnamed_addr constant [37 x i8] c"  PARTIAL MATCH: x agrees, y differs\00"
@.str.exp_equilibrium_mapping.171 = private unnamed_addr constant [11 x i8] c"  MISMATCH\00"
@.str.exp_equilibrium_mapping.172 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.173 = private unnamed_addr constant [54 x i8] c"--- Exp 3: Gradient Flow on Interaction Landscape ---\00"
@.str.exp_equilibrium_mapping.174 = private unnamed_addr constant [55 x i8] c"  Follow ∇||M|| downhill instead of ∇Loss downhill\00"
@.str.exp_equilibrium_mapping.175 = private unnamed_addr constant [50 x i8] c"  Does interaction-flow reach equilibrium faster?\00"
@.str.exp_equilibrium_mapping.176 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.177 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.178 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.179 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.180 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.181 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.182 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.183 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.184 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.185 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.186 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.187 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.188 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_equilibrium_mapping.189 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.190 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_equilibrium_mapping.191 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_equilibrium_mapping.192 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.193 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_equilibrium_mapping.194 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.195 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.196 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_equilibrium_mapping.197 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_equilibrium_mapping.198 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_equilibrium_mapping.199 = private unnamed_addr constant [31 x i8] c"  Loss-flow after 200 steps: (\00"
@.str.exp_equilibrium_mapping.200 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_equilibrium_mapping.201 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_equilibrium_mapping.202 = private unnamed_addr constant [32 x i8] c"  Interaction-flow after 200: (\00"
@.str.exp_equilibrium_mapping.203 = private unnamed_addr constant [3 x i8] c", \00"
@.str.exp_equilibrium_mapping.204 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_equilibrium_mapping.205 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.206 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.207 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.208 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.209 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.210 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.211 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.212 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_equilibrium_mapping.213 = private unnamed_addr constant [32 x i8] c"  Distance to eq (loss-flow):  \00"
@.str.exp_equilibrium_mapping.214 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.215 = private unnamed_addr constant [32 x i8] c"  Distance to eq (inter-flow): \00"
@.str.exp_equilibrium_mapping.216 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.217 = private unnamed_addr constant [54 x i8] c"  FINDING: Interaction-flow is CLOSER to equilibrium!\00"
@.str.exp_equilibrium_mapping.218 = private unnamed_addr constant [53 x i8] c"  Optimizing the STRUCTURE reaches the answer faster\00"
@.str.exp_equilibrium_mapping.219 = private unnamed_addr constant [37 x i8] c"  than optimizing the LOSS directly.\00"
@.str.exp_equilibrium_mapping.220 = private unnamed_addr constant [56 x i8] c"  Loss-flow is closer (expected for simple convex case)\00"
@.str.exp_equilibrium_mapping.221 = private unnamed_addr constant [55 x i8] c"  Interaction-flow may shine on non-convex landscapes.\00"
@.str.exp_equilibrium_mapping.222 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.223 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_equilibrium_mapping.224 = private unnamed_addr constant [33 x i8] c"  EQUILIBRIUM MAPPING VIA dM/dθ\00"
@.str.exp_equilibrium_mapping.225 = private unnamed_addr constant [43 x i8] c"  Find equilibria from structure, not loss\00"
@.str.exp_equilibrium_mapping.226 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_equilibrium_mapping.227 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_equilibrium_mapping.228 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_equilibrium_mapping.229 = private unnamed_addr constant [40 x i8] c"  THESIS: The equilibrium of a composed\00"
@.str.exp_equilibrium_mapping.230 = private unnamed_addr constant [44 x i8] c"  system is where its INTERACTION STRUCTURE\00"
@.str.exp_equilibrium_mapping.231 = private unnamed_addr constant [35 x i8] c"  becomes stationary (dM/dθ = 0).\00"
@.str.exp_equilibrium_mapping.232 = private unnamed_addr constant [46 x i8] c"  This provides a coordinate-free, model-free\00"
@.str.exp_equilibrium_mapping.233 = private unnamed_addr constant [41 x i8] c"  way to locate equilibria from gradient\00"
@.str.exp_equilibrium_mapping.234 = private unnamed_addr constant [44 x i8] c"  topology alone — a form of Morse theory\00"
@.str.exp_equilibrium_mapping.235 = private unnamed_addr constant [31 x i8] c"  for multi-objective systems.\00"
@.str.exp_equilibrium_mapping.236 = private unnamed_addr constant [45 x i8] c"============================================\00"
