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
  %t1 = call i64 @f64_parse(ptr @.str.exp_s_controller.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_s_controller.1)
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

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t22 = load i64, ptr %local.state
  %t23 = mul i64 %t22, 1664525
  %t24 = add i64 %t23, 1013904223
  ret i64 %t24
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.25 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t26 = load i64, ptr %local.state
  store i64 %t26, ptr %local.s.25
  %t27 = load i64, ptr %local.s.25
  %t28 = icmp slt i64 %t27, 0
  %t29 = zext i1 %t28 to i64
  %t30 = icmp ne i64 %t29, 0
  br i1 %t30, label %then3, label %else3
then3:
  %t31 = load i64, ptr %local.s.25
  %t32 = sub i64 0, %t31
  store i64 %t32, ptr %local.s.25
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t33 = phi i64 [ 0, %then3_end ], [ 0, %else3_end ]
  %t34 = load i64, ptr %local.s.25
  %t35 = srem i64 %t34, 10000
  %t36 = call i64 @"sx_int_to_f64"(i64 %t35)
  %t37 = call i64 @f64_parse(ptr @.str.exp_s_controller.2)
  %t38 = call i64 @"sx_f64_div"(i64 %t36, i64 %t37)
  ret i64 %t38
}

define i64 @"compute_s"(i64 %prev_loss, i64 %curr_loss, i64 %prev_drift) nounwind {
entry:
  %local.curr_drift.39 = alloca i64
  %local.prev_loss = alloca i64
  store i64 %prev_loss, ptr %local.prev_loss
  %local.curr_loss = alloca i64
  store i64 %curr_loss, ptr %local.curr_loss
  %local.prev_drift = alloca i64
  store i64 %prev_drift, ptr %local.prev_drift
  %t40 = load i64, ptr %local.curr_loss
  %t41 = load i64, ptr %local.prev_loss
  %t42 = call i64 @"sx_f64_sub"(i64 %t40, i64 %t41)
  %t43 = call i64 @"abs_f64"(i64 %t42)
  store i64 %t43, ptr %local.curr_drift.39
  %t44 = load i64, ptr %local.prev_drift
  %t45 = call i64 @f64_parse(ptr @.str.exp_s_controller.3)
  %t46 = call i64 @"sx_f64_lt"(i64 %t44, i64 %t45)
  %t47 = icmp ne i64 %t46, 0
  br i1 %t47, label %then4, label %else4
then4:
  %t48 = load i64, ptr %local.curr_drift.39
  %t49 = call i64 @f64_parse(ptr @.str.exp_s_controller.4)
  %t50 = call i64 @"sx_f64_lt"(i64 %t48, i64 %t49)
  %t51 = icmp ne i64 %t50, 0
  br i1 %t51, label %then5, label %else5
then5:
  %t52 = call i64 @f64_parse(ptr @.str.exp_s_controller.5)
  ret i64 %t52
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t53 = phi i64 [ 0, %else5_end ]
  %t54 = call i64 @f64_parse(ptr @.str.exp_s_controller.6)
  %t55 = call i64 @f64_parse(ptr @.str.exp_s_controller.7)
  %t56 = call i64 @"sx_f64_sub"(i64 %t54, i64 %t55)
  ret i64 %t56
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t57 = phi i64 [ 0, %else4_end ]
  %t58 = call i64 @f64_parse(ptr @.str.exp_s_controller.8)
  %t59 = load i64, ptr %local.curr_drift.39
  %t60 = load i64, ptr %local.prev_drift
  %t61 = call i64 @"sx_f64_div"(i64 %t59, i64 %t60)
  %t62 = call i64 @"sx_f64_sub"(i64 %t58, i64 %t61)
  ret i64 %t62
}

define i64 @"s_lr"(i64 %base_lr, i64 %s_val) nounwind {
entry:
  %local.base_lr = alloca i64
  store i64 %base_lr, ptr %local.base_lr
  %local.s_val = alloca i64
  store i64 %s_val, ptr %local.s_val
  %t63 = load i64, ptr %local.base_lr
  %t64 = call i64 @f64_parse(ptr @.str.exp_s_controller.9)
  %t65 = load i64, ptr %local.s_val
  %t66 = call i64 @"sx_f64_add"(i64 %t64, i64 %t65)
  %t67 = call i64 @f64_parse(ptr @.str.exp_s_controller.10)
  %t68 = call i64 @f64_parse(ptr @.str.exp_s_controller.11)
  %t69 = call i64 @"clamp"(i64 %t66, i64 %t67, i64 %t68)
  %t70 = call i64 @"sx_f64_mul"(i64 %t63, i64 %t69)
  ret i64 %t70
}

define i64 @"quad_combined"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.la.71 = alloca i64
  %local.lb.72 = alloca i64
  %local.lc.73 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t74 = load i64, ptr %local.w0
  %t75 = call i64 @f64_parse(ptr @.str.exp_s_controller.12)
  %t76 = call i64 @"sx_f64_sub"(i64 %t74, i64 %t75)
  %t77 = load i64, ptr %local.w0
  %t78 = call i64 @f64_parse(ptr @.str.exp_s_controller.13)
  %t79 = call i64 @"sx_f64_sub"(i64 %t77, i64 %t78)
  %t80 = call i64 @"sx_f64_mul"(i64 %t76, i64 %t79)
  %t81 = load i64, ptr %local.w1
  %t82 = call i64 @f64_parse(ptr @.str.exp_s_controller.14)
  %t83 = call i64 @"sx_f64_sub"(i64 %t81, i64 %t82)
  %t84 = load i64, ptr %local.w1
  %t85 = call i64 @f64_parse(ptr @.str.exp_s_controller.15)
  %t86 = call i64 @"sx_f64_sub"(i64 %t84, i64 %t85)
  %t87 = call i64 @"sx_f64_mul"(i64 %t83, i64 %t86)
  %t88 = call i64 @"sx_f64_add"(i64 %t80, i64 %t87)
  store i64 %t88, ptr %local.la.71
  %t89 = load i64, ptr %local.la.71
  %t90 = load i64, ptr %local.w2
  %t91 = call i64 @f64_parse(ptr @.str.exp_s_controller.16)
  %t92 = call i64 @"sx_f64_sub"(i64 %t90, i64 %t91)
  %t93 = load i64, ptr %local.w2
  %t94 = call i64 @f64_parse(ptr @.str.exp_s_controller.17)
  %t95 = call i64 @"sx_f64_sub"(i64 %t93, i64 %t94)
  %t96 = call i64 @"sx_f64_mul"(i64 %t92, i64 %t95)
  %t97 = call i64 @"sx_f64_add"(i64 %t89, i64 %t96)
  %t98 = load i64, ptr %local.w3
  %t99 = call i64 @f64_parse(ptr @.str.exp_s_controller.18)
  %t100 = call i64 @"sx_f64_add"(i64 %t98, i64 %t99)
  %t101 = load i64, ptr %local.w3
  %t102 = call i64 @f64_parse(ptr @.str.exp_s_controller.19)
  %t103 = call i64 @"sx_f64_add"(i64 %t101, i64 %t102)
  %t104 = call i64 @"sx_f64_mul"(i64 %t100, i64 %t103)
  %t105 = call i64 @"sx_f64_add"(i64 %t97, i64 %t104)
  store i64 %t105, ptr %local.la.71
  %t106 = load i64, ptr %local.w0
  %t107 = call i64 @f64_parse(ptr @.str.exp_s_controller.20)
  %t108 = call i64 @"sx_f64_add"(i64 %t106, i64 %t107)
  %t109 = load i64, ptr %local.w0
  %t110 = call i64 @f64_parse(ptr @.str.exp_s_controller.21)
  %t111 = call i64 @"sx_f64_add"(i64 %t109, i64 %t110)
  %t112 = call i64 @"sx_f64_mul"(i64 %t108, i64 %t111)
  %t113 = load i64, ptr %local.w1
  %t114 = call i64 @f64_parse(ptr @.str.exp_s_controller.22)
  %t115 = call i64 @"sx_f64_sub"(i64 %t113, i64 %t114)
  %t116 = load i64, ptr %local.w1
  %t117 = call i64 @f64_parse(ptr @.str.exp_s_controller.23)
  %t118 = call i64 @"sx_f64_sub"(i64 %t116, i64 %t117)
  %t119 = call i64 @"sx_f64_mul"(i64 %t115, i64 %t118)
  %t120 = call i64 @"sx_f64_add"(i64 %t112, i64 %t119)
  store i64 %t120, ptr %local.lb.72
  %t121 = load i64, ptr %local.lb.72
  %t122 = load i64, ptr %local.w2
  %t123 = call i64 @f64_parse(ptr @.str.exp_s_controller.24)
  %t124 = call i64 @"sx_f64_add"(i64 %t122, i64 %t123)
  %t125 = load i64, ptr %local.w2
  %t126 = call i64 @f64_parse(ptr @.str.exp_s_controller.25)
  %t127 = call i64 @"sx_f64_add"(i64 %t125, i64 %t126)
  %t128 = call i64 @"sx_f64_mul"(i64 %t124, i64 %t127)
  %t129 = call i64 @"sx_f64_add"(i64 %t121, i64 %t128)
  %t130 = load i64, ptr %local.w3
  %t131 = call i64 @f64_parse(ptr @.str.exp_s_controller.26)
  %t132 = call i64 @"sx_f64_sub"(i64 %t130, i64 %t131)
  %t133 = load i64, ptr %local.w3
  %t134 = call i64 @f64_parse(ptr @.str.exp_s_controller.27)
  %t135 = call i64 @"sx_f64_sub"(i64 %t133, i64 %t134)
  %t136 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t135)
  %t137 = call i64 @"sx_f64_add"(i64 %t129, i64 %t136)
  store i64 %t137, ptr %local.lb.72
  %t138 = load i64, ptr %local.w0
  %t139 = call i64 @f64_parse(ptr @.str.exp_s_controller.28)
  %t140 = call i64 @"sx_f64_sub"(i64 %t138, i64 %t139)
  %t141 = load i64, ptr %local.w0
  %t142 = call i64 @f64_parse(ptr @.str.exp_s_controller.29)
  %t143 = call i64 @"sx_f64_sub"(i64 %t141, i64 %t142)
  %t144 = call i64 @"sx_f64_mul"(i64 %t140, i64 %t143)
  %t145 = load i64, ptr %local.w1
  %t146 = call i64 @f64_parse(ptr @.str.exp_s_controller.30)
  %t147 = call i64 @"sx_f64_add"(i64 %t145, i64 %t146)
  %t148 = load i64, ptr %local.w1
  %t149 = call i64 @f64_parse(ptr @.str.exp_s_controller.31)
  %t150 = call i64 @"sx_f64_add"(i64 %t148, i64 %t149)
  %t151 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t150)
  %t152 = call i64 @"sx_f64_add"(i64 %t144, i64 %t151)
  store i64 %t152, ptr %local.lc.73
  %t153 = load i64, ptr %local.lc.73
  %t154 = load i64, ptr %local.w2
  %t155 = call i64 @f64_parse(ptr @.str.exp_s_controller.32)
  %t156 = call i64 @"sx_f64_sub"(i64 %t154, i64 %t155)
  %t157 = load i64, ptr %local.w2
  %t158 = call i64 @f64_parse(ptr @.str.exp_s_controller.33)
  %t159 = call i64 @"sx_f64_sub"(i64 %t157, i64 %t158)
  %t160 = call i64 @"sx_f64_mul"(i64 %t156, i64 %t159)
  %t161 = call i64 @"sx_f64_add"(i64 %t153, i64 %t160)
  %t162 = load i64, ptr %local.w3
  %t163 = load i64, ptr %local.w3
  %t164 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t163)
  %t165 = call i64 @"sx_f64_add"(i64 %t161, i64 %t164)
  store i64 %t165, ptr %local.lc.73
  %t166 = load i64, ptr %local.la.71
  %t167 = load i64, ptr %local.lb.72
  %t168 = call i64 @"sx_f64_add"(i64 %t166, i64 %t167)
  %t169 = load i64, ptr %local.lc.73
  %t170 = call i64 @"sx_f64_add"(i64 %t168, i64 %t169)
  ret i64 %t170
}

define i64 @"quad_grad0"(i64 %w0) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %t171 = call i64 @f64_parse(ptr @.str.exp_s_controller.34)
  %t172 = load i64, ptr %local.w0
  %t173 = call i64 @f64_parse(ptr @.str.exp_s_controller.35)
  %t174 = call i64 @"sx_f64_sub"(i64 %t172, i64 %t173)
  %t175 = call i64 @"sx_f64_mul"(i64 %t171, i64 %t174)
  %t176 = call i64 @f64_parse(ptr @.str.exp_s_controller.36)
  %t177 = load i64, ptr %local.w0
  %t178 = call i64 @f64_parse(ptr @.str.exp_s_controller.37)
  %t179 = call i64 @"sx_f64_add"(i64 %t177, i64 %t178)
  %t180 = call i64 @"sx_f64_mul"(i64 %t176, i64 %t179)
  %t181 = call i64 @"sx_f64_add"(i64 %t175, i64 %t180)
  %t182 = call i64 @f64_parse(ptr @.str.exp_s_controller.38)
  %t183 = load i64, ptr %local.w0
  %t184 = call i64 @f64_parse(ptr @.str.exp_s_controller.39)
  %t185 = call i64 @"sx_f64_sub"(i64 %t183, i64 %t184)
  %t186 = call i64 @"sx_f64_mul"(i64 %t182, i64 %t185)
  %t187 = call i64 @"sx_f64_add"(i64 %t181, i64 %t186)
  ret i64 %t187
}

define i64 @"quad_grad1"(i64 %w1) nounwind {
entry:
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %t188 = call i64 @f64_parse(ptr @.str.exp_s_controller.40)
  %t189 = load i64, ptr %local.w1
  %t190 = call i64 @f64_parse(ptr @.str.exp_s_controller.41)
  %t191 = call i64 @"sx_f64_sub"(i64 %t189, i64 %t190)
  %t192 = call i64 @"sx_f64_mul"(i64 %t188, i64 %t191)
  %t193 = call i64 @f64_parse(ptr @.str.exp_s_controller.42)
  %t194 = load i64, ptr %local.w1
  %t195 = call i64 @f64_parse(ptr @.str.exp_s_controller.43)
  %t196 = call i64 @"sx_f64_sub"(i64 %t194, i64 %t195)
  %t197 = call i64 @"sx_f64_mul"(i64 %t193, i64 %t196)
  %t198 = call i64 @"sx_f64_add"(i64 %t192, i64 %t197)
  %t199 = call i64 @f64_parse(ptr @.str.exp_s_controller.44)
  %t200 = load i64, ptr %local.w1
  %t201 = call i64 @f64_parse(ptr @.str.exp_s_controller.45)
  %t202 = call i64 @"sx_f64_add"(i64 %t200, i64 %t201)
  %t203 = call i64 @"sx_f64_mul"(i64 %t199, i64 %t202)
  %t204 = call i64 @"sx_f64_add"(i64 %t198, i64 %t203)
  ret i64 %t204
}

define i64 @"quad_grad2"(i64 %w2) nounwind {
entry:
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %t205 = call i64 @f64_parse(ptr @.str.exp_s_controller.46)
  %t206 = load i64, ptr %local.w2
  %t207 = call i64 @f64_parse(ptr @.str.exp_s_controller.47)
  %t208 = call i64 @"sx_f64_sub"(i64 %t206, i64 %t207)
  %t209 = call i64 @"sx_f64_mul"(i64 %t205, i64 %t208)
  %t210 = call i64 @f64_parse(ptr @.str.exp_s_controller.48)
  %t211 = load i64, ptr %local.w2
  %t212 = call i64 @f64_parse(ptr @.str.exp_s_controller.49)
  %t213 = call i64 @"sx_f64_add"(i64 %t211, i64 %t212)
  %t214 = call i64 @"sx_f64_mul"(i64 %t210, i64 %t213)
  %t215 = call i64 @"sx_f64_add"(i64 %t209, i64 %t214)
  %t216 = call i64 @f64_parse(ptr @.str.exp_s_controller.50)
  %t217 = load i64, ptr %local.w2
  %t218 = call i64 @f64_parse(ptr @.str.exp_s_controller.51)
  %t219 = call i64 @"sx_f64_sub"(i64 %t217, i64 %t218)
  %t220 = call i64 @"sx_f64_mul"(i64 %t216, i64 %t219)
  %t221 = call i64 @"sx_f64_add"(i64 %t215, i64 %t220)
  ret i64 %t221
}

define i64 @"quad_grad3"(i64 %w3) nounwind {
entry:
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t222 = call i64 @f64_parse(ptr @.str.exp_s_controller.52)
  %t223 = load i64, ptr %local.w3
  %t224 = call i64 @f64_parse(ptr @.str.exp_s_controller.53)
  %t225 = call i64 @"sx_f64_add"(i64 %t223, i64 %t224)
  %t226 = call i64 @"sx_f64_mul"(i64 %t222, i64 %t225)
  %t227 = call i64 @f64_parse(ptr @.str.exp_s_controller.54)
  %t228 = load i64, ptr %local.w3
  %t229 = call i64 @f64_parse(ptr @.str.exp_s_controller.55)
  %t230 = call i64 @"sx_f64_sub"(i64 %t228, i64 %t229)
  %t231 = call i64 @"sx_f64_mul"(i64 %t227, i64 %t230)
  %t232 = call i64 @"sx_f64_add"(i64 %t226, i64 %t231)
  %t233 = call i64 @f64_parse(ptr @.str.exp_s_controller.56)
  %t234 = load i64, ptr %local.w3
  %t235 = call i64 @"sx_f64_mul"(i64 %t233, i64 %t234)
  %t236 = call i64 @"sx_f64_add"(i64 %t232, i64 %t235)
  ret i64 %t236
}

define i64 @"train_quad_fixed"(i64 %lr, i64 %steps) nounwind {
entry:
  %local.w0.237 = alloca i64
  %local.w1.238 = alloca i64
  %local.w2.239 = alloca i64
  %local.w3.240 = alloca i64
  %local.step.241 = alloca i64
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t242 = call i64 @f64_parse(ptr @.str.exp_s_controller.57)
  store i64 %t242, ptr %local.w0.237
  %t243 = call i64 @f64_parse(ptr @.str.exp_s_controller.58)
  store i64 %t243, ptr %local.w1.238
  %t244 = call i64 @f64_parse(ptr @.str.exp_s_controller.59)
  store i64 %t244, ptr %local.w2.239
  %t245 = call i64 @f64_parse(ptr @.str.exp_s_controller.60)
  store i64 %t245, ptr %local.w3.240
  store i64 0, ptr %local.step.241
  br label %loop6
loop6:
  %t246 = load i64, ptr %local.step.241
  %t247 = load i64, ptr %local.steps
  %t248 = icmp slt i64 %t246, %t247
  %t249 = zext i1 %t248 to i64
  %t250 = icmp ne i64 %t249, 0
  br i1 %t250, label %body6, label %endloop6
body6:
  %t251 = load i64, ptr %local.w0.237
  %t252 = load i64, ptr %local.lr
  %t253 = load i64, ptr %local.w0.237
  %t254 = call i64 @"quad_grad0"(i64 %t253)
  %t255 = call i64 @"sx_f64_mul"(i64 %t252, i64 %t254)
  %t256 = call i64 @"sx_f64_sub"(i64 %t251, i64 %t255)
  store i64 %t256, ptr %local.w0.237
  %t257 = load i64, ptr %local.w1.238
  %t258 = load i64, ptr %local.lr
  %t259 = load i64, ptr %local.w1.238
  %t260 = call i64 @"quad_grad1"(i64 %t259)
  %t261 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t260)
  %t262 = call i64 @"sx_f64_sub"(i64 %t257, i64 %t261)
  store i64 %t262, ptr %local.w1.238
  %t263 = load i64, ptr %local.w2.239
  %t264 = load i64, ptr %local.lr
  %t265 = load i64, ptr %local.w2.239
  %t266 = call i64 @"quad_grad2"(i64 %t265)
  %t267 = call i64 @"sx_f64_mul"(i64 %t264, i64 %t266)
  %t268 = call i64 @"sx_f64_sub"(i64 %t263, i64 %t267)
  store i64 %t268, ptr %local.w2.239
  %t269 = load i64, ptr %local.w3.240
  %t270 = load i64, ptr %local.lr
  %t271 = load i64, ptr %local.w3.240
  %t272 = call i64 @"quad_grad3"(i64 %t271)
  %t273 = call i64 @"sx_f64_mul"(i64 %t270, i64 %t272)
  %t274 = call i64 @"sx_f64_sub"(i64 %t269, i64 %t273)
  store i64 %t274, ptr %local.w3.240
  %t275 = load i64, ptr %local.step.241
  %t276 = add i64 %t275, 1
  store i64 %t276, ptr %local.step.241
  br label %loop6
endloop6:
  %t277 = load i64, ptr %local.w0.237
  %t278 = load i64, ptr %local.w1.238
  %t279 = load i64, ptr %local.w2.239
  %t280 = load i64, ptr %local.w3.240
  %t281 = call i64 @"quad_combined"(i64 %t277, i64 %t278, i64 %t279, i64 %t280)
  ret i64 %t281
}

define i64 @"train_quad_s_ctrl"(i64 %base_lr, i64 %steps, i64 %verbose) nounwind {
entry:
  %local.w0.282 = alloca i64
  %local.w1.283 = alloca i64
  %local.w2.284 = alloca i64
  %local.w3.285 = alloca i64
  %local.step.286 = alloca i64
  %local.prev_loss.287 = alloca i64
  %local.curr_loss.288 = alloca i64
  %local.prev_drift.289 = alloca i64
  %local.curr_drift.290 = alloca i64
  %local.s_val.291 = alloca i64
  %local.lr.292 = alloca i64
  %local.base_lr = alloca i64
  store i64 %base_lr, ptr %local.base_lr
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.verbose = alloca i64
  store i64 %verbose, ptr %local.verbose
  %t293 = call i64 @f64_parse(ptr @.str.exp_s_controller.61)
  store i64 %t293, ptr %local.w0.282
  %t294 = call i64 @f64_parse(ptr @.str.exp_s_controller.62)
  store i64 %t294, ptr %local.w1.283
  %t295 = call i64 @f64_parse(ptr @.str.exp_s_controller.63)
  store i64 %t295, ptr %local.w2.284
  %t296 = call i64 @f64_parse(ptr @.str.exp_s_controller.64)
  store i64 %t296, ptr %local.w3.285
  store i64 0, ptr %local.step.286
  %t297 = call i64 @f64_parse(ptr @.str.exp_s_controller.65)
  %t298 = call i64 @f64_parse(ptr @.str.exp_s_controller.66)
  %t299 = call i64 @f64_parse(ptr @.str.exp_s_controller.67)
  %t300 = call i64 @f64_parse(ptr @.str.exp_s_controller.68)
  %t301 = call i64 @"quad_combined"(i64 %t297, i64 %t298, i64 %t299, i64 %t300)
  store i64 %t301, ptr %local.prev_loss.287
  %t302 = load i64, ptr %local.prev_loss.287
  store i64 %t302, ptr %local.curr_loss.288
  %t303 = call i64 @f64_parse(ptr @.str.exp_s_controller.69)
  store i64 %t303, ptr %local.prev_drift.289
  %t304 = call i64 @f64_parse(ptr @.str.exp_s_controller.70)
  store i64 %t304, ptr %local.curr_drift.290
  %t305 = call i64 @f64_parse(ptr @.str.exp_s_controller.71)
  store i64 %t305, ptr %local.s_val.291
  %t306 = load i64, ptr %local.base_lr
  store i64 %t306, ptr %local.lr.292
  br label %loop7
loop7:
  %t307 = load i64, ptr %local.step.286
  %t308 = load i64, ptr %local.steps
  %t309 = icmp slt i64 %t307, %t308
  %t310 = zext i1 %t309 to i64
  %t311 = icmp ne i64 %t310, 0
  br i1 %t311, label %body7, label %endloop7
body7:
  %t312 = load i64, ptr %local.w0.282
  %t313 = load i64, ptr %local.w1.283
  %t314 = load i64, ptr %local.w2.284
  %t315 = load i64, ptr %local.w3.285
  %t316 = call i64 @"quad_combined"(i64 %t312, i64 %t313, i64 %t314, i64 %t315)
  store i64 %t316, ptr %local.curr_loss.288
  %t317 = load i64, ptr %local.curr_loss.288
  %t318 = load i64, ptr %local.prev_loss.287
  %t319 = call i64 @"sx_f64_sub"(i64 %t317, i64 %t318)
  %t320 = call i64 @"abs_f64"(i64 %t319)
  store i64 %t320, ptr %local.curr_drift.290
  %t321 = load i64, ptr %local.step.286
  %t322 = icmp sgt i64 %t321, 1
  %t323 = zext i1 %t322 to i64
  %t324 = icmp ne i64 %t323, 0
  br i1 %t324, label %then8, label %else8
then8:
  %t325 = load i64, ptr %local.prev_loss.287
  %t326 = load i64, ptr %local.curr_loss.288
  %t327 = load i64, ptr %local.prev_drift.289
  %t328 = call i64 @"compute_s"(i64 %t325, i64 %t326, i64 %t327)
  store i64 %t328, ptr %local.s_val.291
  %t329 = load i64, ptr %local.base_lr
  %t330 = load i64, ptr %local.s_val.291
  %t331 = call i64 @"s_lr"(i64 %t329, i64 %t330)
  store i64 %t331, ptr %local.lr.292
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t332 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t333 = load i64, ptr %local.w0.282
  %t334 = load i64, ptr %local.lr.292
  %t335 = load i64, ptr %local.w0.282
  %t336 = call i64 @"quad_grad0"(i64 %t335)
  %t337 = call i64 @"sx_f64_mul"(i64 %t334, i64 %t336)
  %t338 = call i64 @"sx_f64_sub"(i64 %t333, i64 %t337)
  store i64 %t338, ptr %local.w0.282
  %t339 = load i64, ptr %local.w1.283
  %t340 = load i64, ptr %local.lr.292
  %t341 = load i64, ptr %local.w1.283
  %t342 = call i64 @"quad_grad1"(i64 %t341)
  %t343 = call i64 @"sx_f64_mul"(i64 %t340, i64 %t342)
  %t344 = call i64 @"sx_f64_sub"(i64 %t339, i64 %t343)
  store i64 %t344, ptr %local.w1.283
  %t345 = load i64, ptr %local.w2.284
  %t346 = load i64, ptr %local.lr.292
  %t347 = load i64, ptr %local.w2.284
  %t348 = call i64 @"quad_grad2"(i64 %t347)
  %t349 = call i64 @"sx_f64_mul"(i64 %t346, i64 %t348)
  %t350 = call i64 @"sx_f64_sub"(i64 %t345, i64 %t349)
  store i64 %t350, ptr %local.w2.284
  %t351 = load i64, ptr %local.w3.285
  %t352 = load i64, ptr %local.lr.292
  %t353 = load i64, ptr %local.w3.285
  %t354 = call i64 @"quad_grad3"(i64 %t353)
  %t355 = call i64 @"sx_f64_mul"(i64 %t352, i64 %t354)
  %t356 = call i64 @"sx_f64_sub"(i64 %t351, i64 %t355)
  store i64 %t356, ptr %local.w3.285
  %t357 = load i64, ptr %local.verbose
  %t358 = icmp eq i64 %t357, 1
  %t359 = zext i1 %t358 to i64
  %t360 = icmp ne i64 %t359, 0
  br i1 %t360, label %then9, label %else9
then9:
  %t361 = load i64, ptr %local.step.286
  %t362 = icmp eq i64 %t361, 10
  %t363 = zext i1 %t362 to i64
  %t364 = icmp ne i64 %t363, 0
  br i1 %t364, label %then10, label %else10
then10:
  %t365 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.72)
  %t366 = ptrtoint ptr %t365 to i64
  %t367 = inttoptr i64 %t366 to ptr
  call void @intrinsic_print(ptr %t367)
  %t368 = load i64, ptr %local.s_val.291
  %t369 = call i64 @"print_f64"(i64 %t368)
  %t370 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.73)
  %t371 = ptrtoint ptr %t370 to i64
  %t372 = inttoptr i64 %t371 to ptr
  call void @intrinsic_print(ptr %t372)
  %t373 = load i64, ptr %local.lr.292
  %t374 = call i64 @"print_f64"(i64 %t373)
  %t375 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.74)
  %t376 = ptrtoint ptr %t375 to i64
  %t377 = inttoptr i64 %t376 to ptr
  call void @intrinsic_print(ptr %t377)
  %t378 = load i64, ptr %local.curr_loss.288
  %t379 = call i64 @"print_f64"(i64 %t378)
  %t380 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.75)
  %t381 = ptrtoint ptr %t380 to i64
  %t382 = inttoptr i64 %t381 to ptr
  call void @intrinsic_println(ptr %t382)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t383 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t384 = load i64, ptr %local.step.286
  %t385 = icmp eq i64 %t384, 50
  %t386 = zext i1 %t385 to i64
  %t387 = icmp ne i64 %t386, 0
  br i1 %t387, label %then11, label %else11
then11:
  %t388 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.76)
  %t389 = ptrtoint ptr %t388 to i64
  %t390 = inttoptr i64 %t389 to ptr
  call void @intrinsic_print(ptr %t390)
  %t391 = load i64, ptr %local.s_val.291
  %t392 = call i64 @"print_f64"(i64 %t391)
  %t393 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.77)
  %t394 = ptrtoint ptr %t393 to i64
  %t395 = inttoptr i64 %t394 to ptr
  call void @intrinsic_print(ptr %t395)
  %t396 = load i64, ptr %local.lr.292
  %t397 = call i64 @"print_f64"(i64 %t396)
  %t398 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.78)
  %t399 = ptrtoint ptr %t398 to i64
  %t400 = inttoptr i64 %t399 to ptr
  call void @intrinsic_print(ptr %t400)
  %t401 = load i64, ptr %local.curr_loss.288
  %t402 = call i64 @"print_f64"(i64 %t401)
  %t403 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.79)
  %t404 = ptrtoint ptr %t403 to i64
  %t405 = inttoptr i64 %t404 to ptr
  call void @intrinsic_println(ptr %t405)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t406 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t407 = load i64, ptr %local.step.286
  %t408 = icmp eq i64 %t407, 100
  %t409 = zext i1 %t408 to i64
  %t410 = icmp ne i64 %t409, 0
  br i1 %t410, label %then12, label %else12
then12:
  %t411 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.80)
  %t412 = ptrtoint ptr %t411 to i64
  %t413 = inttoptr i64 %t412 to ptr
  call void @intrinsic_print(ptr %t413)
  %t414 = load i64, ptr %local.s_val.291
  %t415 = call i64 @"print_f64"(i64 %t414)
  %t416 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.81)
  %t417 = ptrtoint ptr %t416 to i64
  %t418 = inttoptr i64 %t417 to ptr
  call void @intrinsic_print(ptr %t418)
  %t419 = load i64, ptr %local.lr.292
  %t420 = call i64 @"print_f64"(i64 %t419)
  %t421 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.82)
  %t422 = ptrtoint ptr %t421 to i64
  %t423 = inttoptr i64 %t422 to ptr
  call void @intrinsic_print(ptr %t423)
  %t424 = load i64, ptr %local.curr_loss.288
  %t425 = call i64 @"print_f64"(i64 %t424)
  %t426 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.83)
  %t427 = ptrtoint ptr %t426 to i64
  %t428 = inttoptr i64 %t427 to ptr
  call void @intrinsic_println(ptr %t428)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t429 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t430 = load i64, ptr %local.step.286
  %t431 = icmp eq i64 %t430, 250
  %t432 = zext i1 %t431 to i64
  %t433 = icmp ne i64 %t432, 0
  br i1 %t433, label %then13, label %else13
then13:
  %t434 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.84)
  %t435 = ptrtoint ptr %t434 to i64
  %t436 = inttoptr i64 %t435 to ptr
  call void @intrinsic_print(ptr %t436)
  %t437 = load i64, ptr %local.s_val.291
  %t438 = call i64 @"print_f64"(i64 %t437)
  %t439 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.85)
  %t440 = ptrtoint ptr %t439 to i64
  %t441 = inttoptr i64 %t440 to ptr
  call void @intrinsic_print(ptr %t441)
  %t442 = load i64, ptr %local.lr.292
  %t443 = call i64 @"print_f64"(i64 %t442)
  %t444 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.86)
  %t445 = ptrtoint ptr %t444 to i64
  %t446 = inttoptr i64 %t445 to ptr
  call void @intrinsic_print(ptr %t446)
  %t447 = load i64, ptr %local.curr_loss.288
  %t448 = call i64 @"print_f64"(i64 %t447)
  %t449 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.87)
  %t450 = ptrtoint ptr %t449 to i64
  %t451 = inttoptr i64 %t450 to ptr
  call void @intrinsic_println(ptr %t451)
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t452 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t453 = load i64, ptr %local.step.286
  %t454 = icmp eq i64 %t453, 499
  %t455 = zext i1 %t454 to i64
  %t456 = icmp ne i64 %t455, 0
  br i1 %t456, label %then14, label %else14
then14:
  %t457 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.88)
  %t458 = ptrtoint ptr %t457 to i64
  %t459 = inttoptr i64 %t458 to ptr
  call void @intrinsic_print(ptr %t459)
  %t460 = load i64, ptr %local.s_val.291
  %t461 = call i64 @"print_f64"(i64 %t460)
  %t462 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.89)
  %t463 = ptrtoint ptr %t462 to i64
  %t464 = inttoptr i64 %t463 to ptr
  call void @intrinsic_print(ptr %t464)
  %t465 = load i64, ptr %local.lr.292
  %t466 = call i64 @"print_f64"(i64 %t465)
  %t467 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.90)
  %t468 = ptrtoint ptr %t467 to i64
  %t469 = inttoptr i64 %t468 to ptr
  call void @intrinsic_print(ptr %t469)
  %t470 = load i64, ptr %local.curr_loss.288
  %t471 = call i64 @"print_f64"(i64 %t470)
  %t472 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.91)
  %t473 = ptrtoint ptr %t472 to i64
  %t474 = inttoptr i64 %t473 to ptr
  call void @intrinsic_println(ptr %t474)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t475 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t476 = phi i64 [ %t475, %then9_end ], [ 0, %else9_end ]
  %t477 = load i64, ptr %local.curr_drift.290
  store i64 %t477, ptr %local.prev_drift.289
  %t478 = load i64, ptr %local.prev_drift.289
  %t479 = call i64 @f64_parse(ptr @.str.exp_s_controller.92)
  %t480 = call i64 @"sx_f64_lt"(i64 %t478, i64 %t479)
  %t481 = icmp ne i64 %t480, 0
  br i1 %t481, label %then15, label %else15
then15:
  %t482 = call i64 @f64_parse(ptr @.str.exp_s_controller.93)
  store i64 %t482, ptr %local.prev_drift.289
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t483 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t484 = load i64, ptr %local.curr_loss.288
  store i64 %t484, ptr %local.prev_loss.287
  %t485 = load i64, ptr %local.step.286
  %t486 = add i64 %t485, 1
  store i64 %t486, ptr %local.step.286
  br label %loop7
endloop7:
  %t487 = load i64, ptr %local.w0.282
  %t488 = load i64, ptr %local.w1.283
  %t489 = load i64, ptr %local.w2.284
  %t490 = load i64, ptr %local.w3.285
  %t491 = call i64 @"quad_combined"(i64 %t487, i64 %t488, i64 %t489, i64 %t490)
  ret i64 %t491
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.steps.492 = alloca i64
  %local.loss_fast.493 = alloca i64
  %local.loss_slow.494 = alloca i64
  %local.loss_s.495 = alloca i64
  %local.opt_w0.496 = alloca i64
  %local.opt_w1.497 = alloca i64
  %local.opt_w2.498 = alloca i64
  %local.opt_w3.499 = alloca i64
  %local.opt_loss.500 = alloca i64
  %local.gap_fast.501 = alloca i64
  %local.gap_s.502 = alloca i64
  %t503 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.94)
  %t504 = ptrtoint ptr %t503 to i64
  %t505 = inttoptr i64 %t504 to ptr
  call void @intrinsic_println(ptr %t505)
  %t506 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.95)
  %t507 = ptrtoint ptr %t506 to i64
  %t508 = inttoptr i64 %t507 to ptr
  call void @intrinsic_println(ptr %t508)
  %t509 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.96)
  %t510 = ptrtoint ptr %t509 to i64
  %t511 = inttoptr i64 %t510 to ptr
  call void @intrinsic_println(ptr %t511)
  %t512 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.97)
  %t513 = ptrtoint ptr %t512 to i64
  %t514 = inttoptr i64 %t513 to ptr
  call void @intrinsic_println(ptr %t514)
  %t515 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.98)
  %t516 = ptrtoint ptr %t515 to i64
  %t517 = inttoptr i64 %t516 to ptr
  call void @intrinsic_println(ptr %t517)
  %t518 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.99)
  %t519 = ptrtoint ptr %t518 to i64
  %t520 = inttoptr i64 %t519 to ptr
  call void @intrinsic_println(ptr %t520)
  store i64 500, ptr %local.steps.492
  %t521 = call i64 @f64_parse(ptr @.str.exp_s_controller.100)
  %t522 = load i64, ptr %local.steps.492
  %t523 = call i64 @"train_quad_fixed"(i64 %t521, i64 %t522)
  store i64 %t523, ptr %local.loss_fast.493
  %t524 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.101)
  %t525 = ptrtoint ptr %t524 to i64
  %t526 = inttoptr i64 %t525 to ptr
  call void @intrinsic_print(ptr %t526)
  %t527 = load i64, ptr %local.loss_fast.493
  %t528 = call i64 @"print_f64"(i64 %t527)
  %t529 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.102)
  %t530 = ptrtoint ptr %t529 to i64
  %t531 = inttoptr i64 %t530 to ptr
  call void @intrinsic_println(ptr %t531)
  %t532 = call i64 @f64_parse(ptr @.str.exp_s_controller.103)
  %t533 = load i64, ptr %local.steps.492
  %t534 = call i64 @"train_quad_fixed"(i64 %t532, i64 %t533)
  store i64 %t534, ptr %local.loss_slow.494
  %t535 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.104)
  %t536 = ptrtoint ptr %t535 to i64
  %t537 = inttoptr i64 %t536 to ptr
  call void @intrinsic_print(ptr %t537)
  %t538 = load i64, ptr %local.loss_slow.494
  %t539 = call i64 @"print_f64"(i64 %t538)
  %t540 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.105)
  %t541 = ptrtoint ptr %t540 to i64
  %t542 = inttoptr i64 %t541 to ptr
  call void @intrinsic_println(ptr %t542)
  %t543 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.106)
  %t544 = ptrtoint ptr %t543 to i64
  %t545 = inttoptr i64 %t544 to ptr
  call void @intrinsic_println(ptr %t545)
  %t546 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.107)
  %t547 = ptrtoint ptr %t546 to i64
  %t548 = inttoptr i64 %t547 to ptr
  call void @intrinsic_println(ptr %t548)
  %t549 = call i64 @f64_parse(ptr @.str.exp_s_controller.108)
  %t550 = load i64, ptr %local.steps.492
  %t551 = call i64 @"train_quad_s_ctrl"(i64 %t549, i64 %t550, i64 1)
  store i64 %t551, ptr %local.loss_s.495
  %t552 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.109)
  %t553 = ptrtoint ptr %t552 to i64
  %t554 = inttoptr i64 %t553 to ptr
  call void @intrinsic_print(ptr %t554)
  %t555 = load i64, ptr %local.loss_s.495
  %t556 = call i64 @"print_f64"(i64 %t555)
  %t557 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.110)
  %t558 = ptrtoint ptr %t557 to i64
  %t559 = inttoptr i64 %t558 to ptr
  call void @intrinsic_println(ptr %t559)
  %t560 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.111)
  %t561 = ptrtoint ptr %t560 to i64
  %t562 = inttoptr i64 %t561 to ptr
  call void @intrinsic_println(ptr %t562)
  %t563 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.112)
  %t564 = ptrtoint ptr %t563 to i64
  %t565 = inttoptr i64 %t564 to ptr
  call void @intrinsic_println(ptr %t565)
  %t566 = load i64, ptr %local.loss_s.495
  %t567 = load i64, ptr %local.loss_fast.493
  %t568 = call i64 @"sx_f64_lt"(i64 %t566, i64 %t567)
  %t569 = icmp ne i64 %t568, 0
  br i1 %t569, label %then16, label %else16
then16:
  %t570 = load i64, ptr %local.loss_s.495
  %t571 = load i64, ptr %local.loss_slow.494
  %t572 = call i64 @"sx_f64_lt"(i64 %t570, i64 %t571)
  %t573 = icmp ne i64 %t572, 0
  br i1 %t573, label %then17, label %else17
then17:
  %t574 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.113)
  %t575 = ptrtoint ptr %t574 to i64
  %t576 = inttoptr i64 %t575 to ptr
  call void @intrinsic_println(ptr %t576)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  %t577 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.114)
  %t578 = ptrtoint ptr %t577 to i64
  %t579 = inttoptr i64 %t578 to ptr
  call void @intrinsic_println(ptr %t579)
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t580 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  br label %then16_end
then16_end:
  br label %endif16
else16:
  %t581 = load i64, ptr %local.loss_s.495
  %t582 = load i64, ptr %local.loss_slow.494
  %t583 = call i64 @"sx_f64_lt"(i64 %t581, i64 %t582)
  %t584 = icmp ne i64 %t583, 0
  br i1 %t584, label %then18, label %else18
then18:
  %t585 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.115)
  %t586 = ptrtoint ptr %t585 to i64
  %t587 = inttoptr i64 %t586 to ptr
  call void @intrinsic_println(ptr %t587)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  %t588 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.116)
  %t589 = ptrtoint ptr %t588 to i64
  %t590 = inttoptr i64 %t589 to ptr
  call void @intrinsic_println(ptr %t590)
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t591 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t592 = phi i64 [ %t580, %then16_end ], [ %t591, %else16_end ]
  %t593 = call i64 @f64_parse(ptr @.str.exp_s_controller.117)
  %t594 = call i64 @f64_parse(ptr @.str.exp_s_controller.118)
  %t595 = call i64 @"sx_f64_div"(i64 %t593, i64 %t594)
  store i64 %t595, ptr %local.opt_w0.496
  %t596 = call i64 @f64_parse(ptr @.str.exp_s_controller.119)
  %t597 = call i64 @f64_parse(ptr @.str.exp_s_controller.120)
  %t598 = call i64 @"sx_f64_div"(i64 %t596, i64 %t597)
  store i64 %t598, ptr %local.opt_w1.497
  %t599 = call i64 @f64_parse(ptr @.str.exp_s_controller.121)
  %t600 = call i64 @f64_parse(ptr @.str.exp_s_controller.122)
  %t601 = call i64 @"sx_f64_div"(i64 %t599, i64 %t600)
  store i64 %t601, ptr %local.opt_w2.498
  %t602 = call i64 @f64_parse(ptr @.str.exp_s_controller.123)
  %t603 = call i64 @f64_parse(ptr @.str.exp_s_controller.124)
  %t604 = call i64 @"sx_f64_div"(i64 %t602, i64 %t603)
  store i64 %t604, ptr %local.opt_w3.499
  %t605 = load i64, ptr %local.opt_w0.496
  %t606 = load i64, ptr %local.opt_w1.497
  %t607 = load i64, ptr %local.opt_w2.498
  %t608 = load i64, ptr %local.opt_w3.499
  %t609 = call i64 @"quad_combined"(i64 %t605, i64 %t606, i64 %t607, i64 %t608)
  store i64 %t609, ptr %local.opt_loss.500
  %t610 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.125)
  %t611 = ptrtoint ptr %t610 to i64
  %t612 = inttoptr i64 %t611 to ptr
  call void @intrinsic_print(ptr %t612)
  %t613 = load i64, ptr %local.opt_loss.500
  %t614 = call i64 @"print_f64"(i64 %t613)
  %t615 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.126)
  %t616 = ptrtoint ptr %t615 to i64
  %t617 = inttoptr i64 %t616 to ptr
  call void @intrinsic_println(ptr %t617)
  %t618 = load i64, ptr %local.loss_fast.493
  %t619 = load i64, ptr %local.opt_loss.500
  %t620 = call i64 @"sx_f64_sub"(i64 %t618, i64 %t619)
  store i64 %t620, ptr %local.gap_fast.501
  %t621 = load i64, ptr %local.loss_s.495
  %t622 = load i64, ptr %local.opt_loss.500
  %t623 = call i64 @"sx_f64_sub"(i64 %t621, i64 %t622)
  store i64 %t623, ptr %local.gap_s.502
  %t624 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.127)
  %t625 = ptrtoint ptr %t624 to i64
  %t626 = inttoptr i64 %t625 to ptr
  call void @intrinsic_print(ptr %t626)
  %t627 = load i64, ptr %local.gap_fast.501
  %t628 = call i64 @"print_f64"(i64 %t627)
  %t629 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.128)
  %t630 = ptrtoint ptr %t629 to i64
  %t631 = inttoptr i64 %t630 to ptr
  call void @intrinsic_println(ptr %t631)
  %t632 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.129)
  %t633 = ptrtoint ptr %t632 to i64
  %t634 = inttoptr i64 %t633 to ptr
  call void @intrinsic_print(ptr %t634)
  %t635 = load i64, ptr %local.gap_s.502
  %t636 = call i64 @"print_f64"(i64 %t635)
  %t637 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.130)
  %t638 = ptrtoint ptr %t637 to i64
  %t639 = inttoptr i64 %t638 to ptr
  call void @intrinsic_println(ptr %t639)
  %t640 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.131)
  %t641 = ptrtoint ptr %t640 to i64
  %t642 = inttoptr i64 %t641 to ptr
  call void @intrinsic_println(ptr %t642)
  ret i64 0
}

define i64 @"rast_1d"(i64 %w) nounwind {
entry:
  %local.pi.643 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %t644 = call i64 @f64_parse(ptr @.str.exp_s_controller.132)
  store i64 %t644, ptr %local.pi.643
  %t645 = load i64, ptr %local.w
  %t646 = load i64, ptr %local.w
  %t647 = call i64 @"sx_f64_mul"(i64 %t645, i64 %t646)
  %t648 = call i64 @f64_parse(ptr @.str.exp_s_controller.133)
  %t649 = call i64 @f64_parse(ptr @.str.exp_s_controller.134)
  %t650 = load i64, ptr %local.pi.643
  %t651 = call i64 @"sx_f64_mul"(i64 %t649, i64 %t650)
  %t652 = load i64, ptr %local.w
  %t653 = call i64 @"sx_f64_mul"(i64 %t651, i64 %t652)
  %t654 = call i64 @"cos_f64"(i64 %t653)
  %t655 = call i64 @"sx_f64_mul"(i64 %t648, i64 %t654)
  %t656 = call i64 @"sx_f64_sub"(i64 %t647, i64 %t655)
  %t657 = call i64 @f64_parse(ptr @.str.exp_s_controller.135)
  %t658 = call i64 @"sx_f64_add"(i64 %t656, i64 %t657)
  ret i64 %t658
}

define i64 @"rast_grad_1d"(i64 %w) nounwind {
entry:
  %local.pi.659 = alloca i64
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %t660 = call i64 @f64_parse(ptr @.str.exp_s_controller.136)
  store i64 %t660, ptr %local.pi.659
  %t661 = call i64 @f64_parse(ptr @.str.exp_s_controller.137)
  %t662 = load i64, ptr %local.w
  %t663 = call i64 @"sx_f64_mul"(i64 %t661, i64 %t662)
  %t664 = call i64 @f64_parse(ptr @.str.exp_s_controller.138)
  %t665 = load i64, ptr %local.pi.659
  %t666 = call i64 @"sx_f64_mul"(i64 %t664, i64 %t665)
  %t667 = call i64 @f64_parse(ptr @.str.exp_s_controller.139)
  %t668 = load i64, ptr %local.pi.659
  %t669 = call i64 @"sx_f64_mul"(i64 %t667, i64 %t668)
  %t670 = load i64, ptr %local.w
  %t671 = call i64 @"sx_f64_mul"(i64 %t669, i64 %t670)
  %t672 = call i64 @"sin_f64"(i64 %t671)
  %t673 = call i64 @"sx_f64_mul"(i64 %t666, i64 %t672)
  %t674 = call i64 @"sx_f64_add"(i64 %t663, i64 %t673)
  ret i64 %t674
}

define i64 @"rast_combined"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.la.675 = alloca i64
  %local.lb.676 = alloca i64
  %local.lc.677 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t678 = load i64, ptr %local.w0
  %t679 = call i64 @f64_parse(ptr @.str.exp_s_controller.140)
  %t680 = call i64 @"sx_f64_sub"(i64 %t678, i64 %t679)
  %t681 = call i64 @"rast_1d"(i64 %t680)
  %t682 = load i64, ptr %local.w1
  %t683 = call i64 @f64_parse(ptr @.str.exp_s_controller.141)
  %t684 = call i64 @"sx_f64_sub"(i64 %t682, i64 %t683)
  %t685 = call i64 @"rast_1d"(i64 %t684)
  %t686 = call i64 @"sx_f64_add"(i64 %t681, i64 %t685)
  store i64 %t686, ptr %local.la.675
  %t687 = load i64, ptr %local.la.675
  %t688 = load i64, ptr %local.w2
  %t689 = call i64 @f64_parse(ptr @.str.exp_s_controller.142)
  %t690 = call i64 @"sx_f64_add"(i64 %t688, i64 %t689)
  %t691 = call i64 @"rast_1d"(i64 %t690)
  %t692 = call i64 @"sx_f64_add"(i64 %t687, i64 %t691)
  %t693 = load i64, ptr %local.w3
  %t694 = call i64 @f64_parse(ptr @.str.exp_s_controller.143)
  %t695 = call i64 @"sx_f64_sub"(i64 %t693, i64 %t694)
  %t696 = call i64 @"rast_1d"(i64 %t695)
  %t697 = call i64 @"sx_f64_add"(i64 %t692, i64 %t696)
  store i64 %t697, ptr %local.la.675
  %t698 = load i64, ptr %local.w0
  %t699 = call i64 @f64_parse(ptr @.str.exp_s_controller.144)
  %t700 = call i64 @"sx_f64_add"(i64 %t698, i64 %t699)
  %t701 = call i64 @"rast_1d"(i64 %t700)
  %t702 = load i64, ptr %local.w1
  %t703 = call i64 @f64_parse(ptr @.str.exp_s_controller.145)
  %t704 = call i64 @"sx_f64_sub"(i64 %t702, i64 %t703)
  %t705 = call i64 @"rast_1d"(i64 %t704)
  %t706 = call i64 @"sx_f64_add"(i64 %t701, i64 %t705)
  store i64 %t706, ptr %local.lb.676
  %t707 = load i64, ptr %local.lb.676
  %t708 = load i64, ptr %local.w2
  %t709 = call i64 @f64_parse(ptr @.str.exp_s_controller.146)
  %t710 = call i64 @"sx_f64_sub"(i64 %t708, i64 %t709)
  %t711 = call i64 @"rast_1d"(i64 %t710)
  %t712 = call i64 @"sx_f64_add"(i64 %t707, i64 %t711)
  %t713 = load i64, ptr %local.w3
  %t714 = call i64 @f64_parse(ptr @.str.exp_s_controller.147)
  %t715 = call i64 @"sx_f64_add"(i64 %t713, i64 %t714)
  %t716 = call i64 @"rast_1d"(i64 %t715)
  %t717 = call i64 @"sx_f64_add"(i64 %t712, i64 %t716)
  store i64 %t717, ptr %local.lb.676
  %t718 = load i64, ptr %local.w0
  %t719 = call i64 @f64_parse(ptr @.str.exp_s_controller.148)
  %t720 = call i64 @"sx_f64_sub"(i64 %t718, i64 %t719)
  %t721 = call i64 @"rast_1d"(i64 %t720)
  %t722 = load i64, ptr %local.w1
  %t723 = call i64 @f64_parse(ptr @.str.exp_s_controller.149)
  %t724 = call i64 @"sx_f64_add"(i64 %t722, i64 %t723)
  %t725 = call i64 @"rast_1d"(i64 %t724)
  %t726 = call i64 @"sx_f64_add"(i64 %t721, i64 %t725)
  store i64 %t726, ptr %local.lc.677
  %t727 = load i64, ptr %local.lc.677
  %t728 = load i64, ptr %local.w2
  %t729 = call i64 @f64_parse(ptr @.str.exp_s_controller.150)
  %t730 = call i64 @"sx_f64_sub"(i64 %t728, i64 %t729)
  %t731 = call i64 @"rast_1d"(i64 %t730)
  %t732 = call i64 @"sx_f64_add"(i64 %t727, i64 %t731)
  %t733 = load i64, ptr %local.w3
  %t734 = call i64 @"rast_1d"(i64 %t733)
  %t735 = call i64 @"sx_f64_add"(i64 %t732, i64 %t734)
  store i64 %t735, ptr %local.lc.677
  %t736 = load i64, ptr %local.la.675
  %t737 = load i64, ptr %local.lb.676
  %t738 = call i64 @"sx_f64_add"(i64 %t736, i64 %t737)
  %t739 = load i64, ptr %local.lc.677
  %t740 = call i64 @"sx_f64_add"(i64 %t738, i64 %t739)
  ret i64 %t740
}

define i64 @"rast_comb_grad0"(i64 %w0) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %t741 = load i64, ptr %local.w0
  %t742 = call i64 @f64_parse(ptr @.str.exp_s_controller.151)
  %t743 = call i64 @"sx_f64_sub"(i64 %t741, i64 %t742)
  %t744 = call i64 @"rast_grad_1d"(i64 %t743)
  %t745 = load i64, ptr %local.w0
  %t746 = call i64 @f64_parse(ptr @.str.exp_s_controller.152)
  %t747 = call i64 @"sx_f64_add"(i64 %t745, i64 %t746)
  %t748 = call i64 @"rast_grad_1d"(i64 %t747)
  %t749 = call i64 @"sx_f64_add"(i64 %t744, i64 %t748)
  %t750 = load i64, ptr %local.w0
  %t751 = call i64 @f64_parse(ptr @.str.exp_s_controller.153)
  %t752 = call i64 @"sx_f64_sub"(i64 %t750, i64 %t751)
  %t753 = call i64 @"rast_grad_1d"(i64 %t752)
  %t754 = call i64 @"sx_f64_add"(i64 %t749, i64 %t753)
  ret i64 %t754
}

define i64 @"rast_comb_grad1"(i64 %w1) nounwind {
entry:
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %t755 = load i64, ptr %local.w1
  %t756 = call i64 @f64_parse(ptr @.str.exp_s_controller.154)
  %t757 = call i64 @"sx_f64_sub"(i64 %t755, i64 %t756)
  %t758 = call i64 @"rast_grad_1d"(i64 %t757)
  %t759 = load i64, ptr %local.w1
  %t760 = call i64 @f64_parse(ptr @.str.exp_s_controller.155)
  %t761 = call i64 @"sx_f64_sub"(i64 %t759, i64 %t760)
  %t762 = call i64 @"rast_grad_1d"(i64 %t761)
  %t763 = call i64 @"sx_f64_add"(i64 %t758, i64 %t762)
  %t764 = load i64, ptr %local.w1
  %t765 = call i64 @f64_parse(ptr @.str.exp_s_controller.156)
  %t766 = call i64 @"sx_f64_add"(i64 %t764, i64 %t765)
  %t767 = call i64 @"rast_grad_1d"(i64 %t766)
  %t768 = call i64 @"sx_f64_add"(i64 %t763, i64 %t767)
  ret i64 %t768
}

define i64 @"rast_comb_grad2"(i64 %w2) nounwind {
entry:
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %t769 = load i64, ptr %local.w2
  %t770 = call i64 @f64_parse(ptr @.str.exp_s_controller.157)
  %t771 = call i64 @"sx_f64_add"(i64 %t769, i64 %t770)
  %t772 = call i64 @"rast_grad_1d"(i64 %t771)
  %t773 = load i64, ptr %local.w2
  %t774 = call i64 @f64_parse(ptr @.str.exp_s_controller.158)
  %t775 = call i64 @"sx_f64_sub"(i64 %t773, i64 %t774)
  %t776 = call i64 @"rast_grad_1d"(i64 %t775)
  %t777 = call i64 @"sx_f64_add"(i64 %t772, i64 %t776)
  %t778 = load i64, ptr %local.w2
  %t779 = call i64 @f64_parse(ptr @.str.exp_s_controller.159)
  %t780 = call i64 @"sx_f64_sub"(i64 %t778, i64 %t779)
  %t781 = call i64 @"rast_grad_1d"(i64 %t780)
  %t782 = call i64 @"sx_f64_add"(i64 %t777, i64 %t781)
  ret i64 %t782
}

define i64 @"rast_comb_grad3"(i64 %w3) nounwind {
entry:
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t783 = load i64, ptr %local.w3
  %t784 = call i64 @f64_parse(ptr @.str.exp_s_controller.160)
  %t785 = call i64 @"sx_f64_sub"(i64 %t783, i64 %t784)
  %t786 = call i64 @"rast_grad_1d"(i64 %t785)
  %t787 = load i64, ptr %local.w3
  %t788 = call i64 @f64_parse(ptr @.str.exp_s_controller.161)
  %t789 = call i64 @"sx_f64_add"(i64 %t787, i64 %t788)
  %t790 = call i64 @"rast_grad_1d"(i64 %t789)
  %t791 = call i64 @"sx_f64_add"(i64 %t786, i64 %t790)
  %t792 = load i64, ptr %local.w3
  %t793 = call i64 @"rast_grad_1d"(i64 %t792)
  %t794 = call i64 @"sx_f64_add"(i64 %t791, i64 %t793)
  ret i64 %t794
}

define i64 @"train_rast_fixed"(i64 %lr, i64 %steps) nounwind {
entry:
  %local.w0.795 = alloca i64
  %local.w1.796 = alloca i64
  %local.w2.797 = alloca i64
  %local.w3.798 = alloca i64
  %local.step.799 = alloca i64
  %local.g0.800 = alloca i64
  %local.g1.801 = alloca i64
  %local.g2.802 = alloca i64
  %local.g3.803 = alloca i64
  %local.lr = alloca i64
  store i64 %lr, ptr %local.lr
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t804 = call i64 @f64_parse(ptr @.str.exp_s_controller.162)
  store i64 %t804, ptr %local.w0.795
  %t805 = call i64 @f64_parse(ptr @.str.exp_s_controller.163)
  %t806 = call i64 @f64_parse(ptr @.str.exp_s_controller.164)
  %t807 = call i64 @"sx_f64_sub"(i64 %t805, i64 %t806)
  store i64 %t807, ptr %local.w1.796
  %t808 = call i64 @f64_parse(ptr @.str.exp_s_controller.165)
  store i64 %t808, ptr %local.w2.797
  %t809 = call i64 @f64_parse(ptr @.str.exp_s_controller.166)
  %t810 = call i64 @f64_parse(ptr @.str.exp_s_controller.167)
  %t811 = call i64 @"sx_f64_sub"(i64 %t809, i64 %t810)
  store i64 %t811, ptr %local.w3.798
  store i64 0, ptr %local.step.799
  %t812 = call i64 @f64_parse(ptr @.str.exp_s_controller.168)
  store i64 %t812, ptr %local.g0.800
  %t813 = call i64 @f64_parse(ptr @.str.exp_s_controller.169)
  store i64 %t813, ptr %local.g1.801
  %t814 = call i64 @f64_parse(ptr @.str.exp_s_controller.170)
  store i64 %t814, ptr %local.g2.802
  %t815 = call i64 @f64_parse(ptr @.str.exp_s_controller.171)
  store i64 %t815, ptr %local.g3.803
  br label %loop19
loop19:
  %t816 = load i64, ptr %local.step.799
  %t817 = load i64, ptr %local.steps
  %t818 = icmp slt i64 %t816, %t817
  %t819 = zext i1 %t818 to i64
  %t820 = icmp ne i64 %t819, 0
  br i1 %t820, label %body19, label %endloop19
body19:
  %t821 = load i64, ptr %local.w0.795
  %t822 = call i64 @"rast_comb_grad0"(i64 %t821)
  store i64 %t822, ptr %local.g0.800
  %t823 = load i64, ptr %local.w1.796
  %t824 = call i64 @"rast_comb_grad1"(i64 %t823)
  store i64 %t824, ptr %local.g1.801
  %t825 = load i64, ptr %local.w2.797
  %t826 = call i64 @"rast_comb_grad2"(i64 %t825)
  store i64 %t826, ptr %local.g2.802
  %t827 = load i64, ptr %local.w3.798
  %t828 = call i64 @"rast_comb_grad3"(i64 %t827)
  store i64 %t828, ptr %local.g3.803
  %t829 = load i64, ptr %local.w0.795
  %t830 = load i64, ptr %local.lr
  %t831 = load i64, ptr %local.g0.800
  %t832 = call i64 @"sx_f64_mul"(i64 %t830, i64 %t831)
  %t833 = call i64 @"sx_f64_sub"(i64 %t829, i64 %t832)
  store i64 %t833, ptr %local.w0.795
  %t834 = load i64, ptr %local.w1.796
  %t835 = load i64, ptr %local.lr
  %t836 = load i64, ptr %local.g1.801
  %t837 = call i64 @"sx_f64_mul"(i64 %t835, i64 %t836)
  %t838 = call i64 @"sx_f64_sub"(i64 %t834, i64 %t837)
  store i64 %t838, ptr %local.w1.796
  %t839 = load i64, ptr %local.w2.797
  %t840 = load i64, ptr %local.lr
  %t841 = load i64, ptr %local.g2.802
  %t842 = call i64 @"sx_f64_mul"(i64 %t840, i64 %t841)
  %t843 = call i64 @"sx_f64_sub"(i64 %t839, i64 %t842)
  store i64 %t843, ptr %local.w2.797
  %t844 = load i64, ptr %local.w3.798
  %t845 = load i64, ptr %local.lr
  %t846 = load i64, ptr %local.g3.803
  %t847 = call i64 @"sx_f64_mul"(i64 %t845, i64 %t846)
  %t848 = call i64 @"sx_f64_sub"(i64 %t844, i64 %t847)
  store i64 %t848, ptr %local.w3.798
  %t849 = load i64, ptr %local.step.799
  %t850 = add i64 %t849, 1
  store i64 %t850, ptr %local.step.799
  br label %loop19
endloop19:
  %t851 = load i64, ptr %local.w0.795
  %t852 = load i64, ptr %local.w1.796
  %t853 = load i64, ptr %local.w2.797
  %t854 = load i64, ptr %local.w3.798
  %t855 = call i64 @"rast_combined"(i64 %t851, i64 %t852, i64 %t853, i64 %t854)
  ret i64 %t855
}

define i64 @"train_rast_s_ctrl"(i64 %base_lr, i64 %steps, i64 %verbose) nounwind {
entry:
  %local.w0.856 = alloca i64
  %local.w1.857 = alloca i64
  %local.w2.858 = alloca i64
  %local.w3.859 = alloca i64
  %local.step.860 = alloca i64
  %local.prev_loss.861 = alloca i64
  %local.curr_loss.862 = alloca i64
  %local.prev_drift.863 = alloca i64
  %local.curr_drift.864 = alloca i64
  %local.s_val.865 = alloca i64
  %local.lr.866 = alloca i64
  %local.g0.867 = alloca i64
  %local.g1.868 = alloca i64
  %local.g2.869 = alloca i64
  %local.g3.870 = alloca i64
  %local.base_lr = alloca i64
  store i64 %base_lr, ptr %local.base_lr
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.verbose = alloca i64
  store i64 %verbose, ptr %local.verbose
  %t871 = call i64 @f64_parse(ptr @.str.exp_s_controller.172)
  store i64 %t871, ptr %local.w0.856
  %t872 = call i64 @f64_parse(ptr @.str.exp_s_controller.173)
  %t873 = call i64 @f64_parse(ptr @.str.exp_s_controller.174)
  %t874 = call i64 @"sx_f64_sub"(i64 %t872, i64 %t873)
  store i64 %t874, ptr %local.w1.857
  %t875 = call i64 @f64_parse(ptr @.str.exp_s_controller.175)
  store i64 %t875, ptr %local.w2.858
  %t876 = call i64 @f64_parse(ptr @.str.exp_s_controller.176)
  %t877 = call i64 @f64_parse(ptr @.str.exp_s_controller.177)
  %t878 = call i64 @"sx_f64_sub"(i64 %t876, i64 %t877)
  store i64 %t878, ptr %local.w3.859
  store i64 0, ptr %local.step.860
  %t879 = call i64 @f64_parse(ptr @.str.exp_s_controller.178)
  %t880 = call i64 @f64_parse(ptr @.str.exp_s_controller.179)
  %t881 = call i64 @f64_parse(ptr @.str.exp_s_controller.180)
  %t882 = call i64 @"sx_f64_sub"(i64 %t880, i64 %t881)
  %t883 = call i64 @f64_parse(ptr @.str.exp_s_controller.181)
  %t884 = call i64 @f64_parse(ptr @.str.exp_s_controller.182)
  %t885 = call i64 @f64_parse(ptr @.str.exp_s_controller.183)
  %t886 = call i64 @"sx_f64_sub"(i64 %t884, i64 %t885)
  %t887 = call i64 @"rast_combined"(i64 %t879, i64 %t882, i64 %t883, i64 %t886)
  store i64 %t887, ptr %local.prev_loss.861
  %t888 = load i64, ptr %local.prev_loss.861
  store i64 %t888, ptr %local.curr_loss.862
  %t889 = call i64 @f64_parse(ptr @.str.exp_s_controller.184)
  store i64 %t889, ptr %local.prev_drift.863
  %t890 = call i64 @f64_parse(ptr @.str.exp_s_controller.185)
  store i64 %t890, ptr %local.curr_drift.864
  %t891 = call i64 @f64_parse(ptr @.str.exp_s_controller.186)
  store i64 %t891, ptr %local.s_val.865
  %t892 = load i64, ptr %local.base_lr
  store i64 %t892, ptr %local.lr.866
  %t893 = call i64 @f64_parse(ptr @.str.exp_s_controller.187)
  store i64 %t893, ptr %local.g0.867
  %t894 = call i64 @f64_parse(ptr @.str.exp_s_controller.188)
  store i64 %t894, ptr %local.g1.868
  %t895 = call i64 @f64_parse(ptr @.str.exp_s_controller.189)
  store i64 %t895, ptr %local.g2.869
  %t896 = call i64 @f64_parse(ptr @.str.exp_s_controller.190)
  store i64 %t896, ptr %local.g3.870
  br label %loop20
loop20:
  %t897 = load i64, ptr %local.step.860
  %t898 = load i64, ptr %local.steps
  %t899 = icmp slt i64 %t897, %t898
  %t900 = zext i1 %t899 to i64
  %t901 = icmp ne i64 %t900, 0
  br i1 %t901, label %body20, label %endloop20
body20:
  %t902 = load i64, ptr %local.w0.856
  %t903 = load i64, ptr %local.w1.857
  %t904 = load i64, ptr %local.w2.858
  %t905 = load i64, ptr %local.w3.859
  %t906 = call i64 @"rast_combined"(i64 %t902, i64 %t903, i64 %t904, i64 %t905)
  store i64 %t906, ptr %local.curr_loss.862
  %t907 = load i64, ptr %local.curr_loss.862
  %t908 = load i64, ptr %local.prev_loss.861
  %t909 = call i64 @"sx_f64_sub"(i64 %t907, i64 %t908)
  %t910 = call i64 @"abs_f64"(i64 %t909)
  store i64 %t910, ptr %local.curr_drift.864
  %t911 = load i64, ptr %local.step.860
  %t912 = icmp sgt i64 %t911, 1
  %t913 = zext i1 %t912 to i64
  %t914 = icmp ne i64 %t913, 0
  br i1 %t914, label %then21, label %else21
then21:
  %t915 = load i64, ptr %local.prev_loss.861
  %t916 = load i64, ptr %local.curr_loss.862
  %t917 = load i64, ptr %local.prev_drift.863
  %t918 = call i64 @"compute_s"(i64 %t915, i64 %t916, i64 %t917)
  store i64 %t918, ptr %local.s_val.865
  %t919 = load i64, ptr %local.base_lr
  %t920 = load i64, ptr %local.s_val.865
  %t921 = call i64 @"s_lr"(i64 %t919, i64 %t920)
  store i64 %t921, ptr %local.lr.866
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t922 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t923 = load i64, ptr %local.w0.856
  %t924 = call i64 @"rast_comb_grad0"(i64 %t923)
  store i64 %t924, ptr %local.g0.867
  %t925 = load i64, ptr %local.w1.857
  %t926 = call i64 @"rast_comb_grad1"(i64 %t925)
  store i64 %t926, ptr %local.g1.868
  %t927 = load i64, ptr %local.w2.858
  %t928 = call i64 @"rast_comb_grad2"(i64 %t927)
  store i64 %t928, ptr %local.g2.869
  %t929 = load i64, ptr %local.w3.859
  %t930 = call i64 @"rast_comb_grad3"(i64 %t929)
  store i64 %t930, ptr %local.g3.870
  %t931 = load i64, ptr %local.w0.856
  %t932 = load i64, ptr %local.lr.866
  %t933 = load i64, ptr %local.g0.867
  %t934 = call i64 @"sx_f64_mul"(i64 %t932, i64 %t933)
  %t935 = call i64 @"sx_f64_sub"(i64 %t931, i64 %t934)
  store i64 %t935, ptr %local.w0.856
  %t936 = load i64, ptr %local.w1.857
  %t937 = load i64, ptr %local.lr.866
  %t938 = load i64, ptr %local.g1.868
  %t939 = call i64 @"sx_f64_mul"(i64 %t937, i64 %t938)
  %t940 = call i64 @"sx_f64_sub"(i64 %t936, i64 %t939)
  store i64 %t940, ptr %local.w1.857
  %t941 = load i64, ptr %local.w2.858
  %t942 = load i64, ptr %local.lr.866
  %t943 = load i64, ptr %local.g2.869
  %t944 = call i64 @"sx_f64_mul"(i64 %t942, i64 %t943)
  %t945 = call i64 @"sx_f64_sub"(i64 %t941, i64 %t944)
  store i64 %t945, ptr %local.w2.858
  %t946 = load i64, ptr %local.w3.859
  %t947 = load i64, ptr %local.lr.866
  %t948 = load i64, ptr %local.g3.870
  %t949 = call i64 @"sx_f64_mul"(i64 %t947, i64 %t948)
  %t950 = call i64 @"sx_f64_sub"(i64 %t946, i64 %t949)
  store i64 %t950, ptr %local.w3.859
  %t951 = load i64, ptr %local.verbose
  %t952 = icmp eq i64 %t951, 1
  %t953 = zext i1 %t952 to i64
  %t954 = icmp ne i64 %t953, 0
  br i1 %t954, label %then22, label %else22
then22:
  %t955 = load i64, ptr %local.step.860
  %t956 = icmp eq i64 %t955, 10
  %t957 = zext i1 %t956 to i64
  %t958 = icmp ne i64 %t957, 0
  br i1 %t958, label %then23, label %else23
then23:
  %t959 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.191)
  %t960 = ptrtoint ptr %t959 to i64
  %t961 = inttoptr i64 %t960 to ptr
  call void @intrinsic_print(ptr %t961)
  %t962 = load i64, ptr %local.s_val.865
  %t963 = call i64 @"print_f64"(i64 %t962)
  %t964 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.192)
  %t965 = ptrtoint ptr %t964 to i64
  %t966 = inttoptr i64 %t965 to ptr
  call void @intrinsic_print(ptr %t966)
  %t967 = load i64, ptr %local.lr.866
  %t968 = call i64 @"print_f64"(i64 %t967)
  %t969 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.193)
  %t970 = ptrtoint ptr %t969 to i64
  %t971 = inttoptr i64 %t970 to ptr
  call void @intrinsic_print(ptr %t971)
  %t972 = load i64, ptr %local.curr_loss.862
  %t973 = call i64 @"print_f64"(i64 %t972)
  %t974 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.194)
  %t975 = ptrtoint ptr %t974 to i64
  %t976 = inttoptr i64 %t975 to ptr
  call void @intrinsic_println(ptr %t976)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t977 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t978 = load i64, ptr %local.step.860
  %t979 = icmp eq i64 %t978, 100
  %t980 = zext i1 %t979 to i64
  %t981 = icmp ne i64 %t980, 0
  br i1 %t981, label %then24, label %else24
then24:
  %t982 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.195)
  %t983 = ptrtoint ptr %t982 to i64
  %t984 = inttoptr i64 %t983 to ptr
  call void @intrinsic_print(ptr %t984)
  %t985 = load i64, ptr %local.s_val.865
  %t986 = call i64 @"print_f64"(i64 %t985)
  %t987 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.196)
  %t988 = ptrtoint ptr %t987 to i64
  %t989 = inttoptr i64 %t988 to ptr
  call void @intrinsic_print(ptr %t989)
  %t990 = load i64, ptr %local.lr.866
  %t991 = call i64 @"print_f64"(i64 %t990)
  %t992 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.197)
  %t993 = ptrtoint ptr %t992 to i64
  %t994 = inttoptr i64 %t993 to ptr
  call void @intrinsic_print(ptr %t994)
  %t995 = load i64, ptr %local.curr_loss.862
  %t996 = call i64 @"print_f64"(i64 %t995)
  %t997 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.198)
  %t998 = ptrtoint ptr %t997 to i64
  %t999 = inttoptr i64 %t998 to ptr
  call void @intrinsic_println(ptr %t999)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1000 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t1001 = load i64, ptr %local.step.860
  %t1002 = icmp eq i64 %t1001, 250
  %t1003 = zext i1 %t1002 to i64
  %t1004 = icmp ne i64 %t1003, 0
  br i1 %t1004, label %then25, label %else25
then25:
  %t1005 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.199)
  %t1006 = ptrtoint ptr %t1005 to i64
  %t1007 = inttoptr i64 %t1006 to ptr
  call void @intrinsic_print(ptr %t1007)
  %t1008 = load i64, ptr %local.s_val.865
  %t1009 = call i64 @"print_f64"(i64 %t1008)
  %t1010 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.200)
  %t1011 = ptrtoint ptr %t1010 to i64
  %t1012 = inttoptr i64 %t1011 to ptr
  call void @intrinsic_print(ptr %t1012)
  %t1013 = load i64, ptr %local.lr.866
  %t1014 = call i64 @"print_f64"(i64 %t1013)
  %t1015 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.201)
  %t1016 = ptrtoint ptr %t1015 to i64
  %t1017 = inttoptr i64 %t1016 to ptr
  call void @intrinsic_print(ptr %t1017)
  %t1018 = load i64, ptr %local.curr_loss.862
  %t1019 = call i64 @"print_f64"(i64 %t1018)
  %t1020 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.202)
  %t1021 = ptrtoint ptr %t1020 to i64
  %t1022 = inttoptr i64 %t1021 to ptr
  call void @intrinsic_println(ptr %t1022)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1023 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t1024 = load i64, ptr %local.step.860
  %t1025 = icmp eq i64 %t1024, 499
  %t1026 = zext i1 %t1025 to i64
  %t1027 = icmp ne i64 %t1026, 0
  br i1 %t1027, label %then26, label %else26
then26:
  %t1028 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.203)
  %t1029 = ptrtoint ptr %t1028 to i64
  %t1030 = inttoptr i64 %t1029 to ptr
  call void @intrinsic_print(ptr %t1030)
  %t1031 = load i64, ptr %local.s_val.865
  %t1032 = call i64 @"print_f64"(i64 %t1031)
  %t1033 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.204)
  %t1034 = ptrtoint ptr %t1033 to i64
  %t1035 = inttoptr i64 %t1034 to ptr
  call void @intrinsic_print(ptr %t1035)
  %t1036 = load i64, ptr %local.lr.866
  %t1037 = call i64 @"print_f64"(i64 %t1036)
  %t1038 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.205)
  %t1039 = ptrtoint ptr %t1038 to i64
  %t1040 = inttoptr i64 %t1039 to ptr
  call void @intrinsic_print(ptr %t1040)
  %t1041 = load i64, ptr %local.curr_loss.862
  %t1042 = call i64 @"print_f64"(i64 %t1041)
  %t1043 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.206)
  %t1044 = ptrtoint ptr %t1043 to i64
  %t1045 = inttoptr i64 %t1044 to ptr
  call void @intrinsic_println(ptr %t1045)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1046 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t1047 = phi i64 [ %t1046, %then22_end ], [ 0, %else22_end ]
  %t1048 = load i64, ptr %local.curr_drift.864
  store i64 %t1048, ptr %local.prev_drift.863
  %t1049 = load i64, ptr %local.prev_drift.863
  %t1050 = call i64 @f64_parse(ptr @.str.exp_s_controller.207)
  %t1051 = call i64 @"sx_f64_lt"(i64 %t1049, i64 %t1050)
  %t1052 = icmp ne i64 %t1051, 0
  br i1 %t1052, label %then27, label %else27
then27:
  %t1053 = call i64 @f64_parse(ptr @.str.exp_s_controller.208)
  store i64 %t1053, ptr %local.prev_drift.863
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t1054 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t1055 = load i64, ptr %local.curr_loss.862
  store i64 %t1055, ptr %local.prev_loss.861
  %t1056 = load i64, ptr %local.step.860
  %t1057 = add i64 %t1056, 1
  store i64 %t1057, ptr %local.step.860
  br label %loop20
endloop20:
  %t1058 = load i64, ptr %local.w0.856
  %t1059 = load i64, ptr %local.w1.857
  %t1060 = load i64, ptr %local.w2.858
  %t1061 = load i64, ptr %local.w3.859
  %t1062 = call i64 @"rast_combined"(i64 %t1058, i64 %t1059, i64 %t1060, i64 %t1061)
  ret i64 %t1062
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.steps.1063 = alloca i64
  %local.loss_fast.1064 = alloca i64
  %local.loss_slow.1065 = alloca i64
  %local.loss_s.1066 = alloca i64
  %local.best_fixed.1067 = alloca i64
  %local.best_name_fast.1068 = alloca i64
  %local.improve.1069 = alloca i64
  %t1070 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.209)
  %t1071 = ptrtoint ptr %t1070 to i64
  %t1072 = inttoptr i64 %t1071 to ptr
  call void @intrinsic_println(ptr %t1072)
  %t1073 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.210)
  %t1074 = ptrtoint ptr %t1073 to i64
  %t1075 = inttoptr i64 %t1074 to ptr
  call void @intrinsic_println(ptr %t1075)
  %t1076 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.211)
  %t1077 = ptrtoint ptr %t1076 to i64
  %t1078 = inttoptr i64 %t1077 to ptr
  call void @intrinsic_println(ptr %t1078)
  %t1079 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.212)
  %t1080 = ptrtoint ptr %t1079 to i64
  %t1081 = inttoptr i64 %t1080 to ptr
  call void @intrinsic_println(ptr %t1081)
  %t1082 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.213)
  %t1083 = ptrtoint ptr %t1082 to i64
  %t1084 = inttoptr i64 %t1083 to ptr
  call void @intrinsic_println(ptr %t1084)
  %t1085 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.214)
  %t1086 = ptrtoint ptr %t1085 to i64
  %t1087 = inttoptr i64 %t1086 to ptr
  call void @intrinsic_println(ptr %t1087)
  %t1088 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.215)
  %t1089 = ptrtoint ptr %t1088 to i64
  %t1090 = inttoptr i64 %t1089 to ptr
  call void @intrinsic_println(ptr %t1090)
  store i64 500, ptr %local.steps.1063
  %t1091 = call i64 @f64_parse(ptr @.str.exp_s_controller.216)
  %t1092 = load i64, ptr %local.steps.1063
  %t1093 = call i64 @"train_rast_fixed"(i64 %t1091, i64 %t1092)
  store i64 %t1093, ptr %local.loss_fast.1064
  %t1094 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.217)
  %t1095 = ptrtoint ptr %t1094 to i64
  %t1096 = inttoptr i64 %t1095 to ptr
  call void @intrinsic_print(ptr %t1096)
  %t1097 = load i64, ptr %local.loss_fast.1064
  %t1098 = call i64 @"print_f64"(i64 %t1097)
  %t1099 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.218)
  %t1100 = ptrtoint ptr %t1099 to i64
  %t1101 = inttoptr i64 %t1100 to ptr
  call void @intrinsic_println(ptr %t1101)
  %t1102 = call i64 @f64_parse(ptr @.str.exp_s_controller.219)
  %t1103 = load i64, ptr %local.steps.1063
  %t1104 = call i64 @"train_rast_fixed"(i64 %t1102, i64 %t1103)
  store i64 %t1104, ptr %local.loss_slow.1065
  %t1105 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.220)
  %t1106 = ptrtoint ptr %t1105 to i64
  %t1107 = inttoptr i64 %t1106 to ptr
  call void @intrinsic_print(ptr %t1107)
  %t1108 = load i64, ptr %local.loss_slow.1065
  %t1109 = call i64 @"print_f64"(i64 %t1108)
  %t1110 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.221)
  %t1111 = ptrtoint ptr %t1110 to i64
  %t1112 = inttoptr i64 %t1111 to ptr
  call void @intrinsic_println(ptr %t1112)
  %t1113 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.222)
  %t1114 = ptrtoint ptr %t1113 to i64
  %t1115 = inttoptr i64 %t1114 to ptr
  call void @intrinsic_println(ptr %t1115)
  %t1116 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.223)
  %t1117 = ptrtoint ptr %t1116 to i64
  %t1118 = inttoptr i64 %t1117 to ptr
  call void @intrinsic_println(ptr %t1118)
  %t1119 = call i64 @f64_parse(ptr @.str.exp_s_controller.224)
  %t1120 = load i64, ptr %local.steps.1063
  %t1121 = call i64 @"train_rast_s_ctrl"(i64 %t1119, i64 %t1120, i64 1)
  store i64 %t1121, ptr %local.loss_s.1066
  %t1122 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.225)
  %t1123 = ptrtoint ptr %t1122 to i64
  %t1124 = inttoptr i64 %t1123 to ptr
  call void @intrinsic_print(ptr %t1124)
  %t1125 = load i64, ptr %local.loss_s.1066
  %t1126 = call i64 @"print_f64"(i64 %t1125)
  %t1127 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.226)
  %t1128 = ptrtoint ptr %t1127 to i64
  %t1129 = inttoptr i64 %t1128 to ptr
  call void @intrinsic_println(ptr %t1129)
  %t1130 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.227)
  %t1131 = ptrtoint ptr %t1130 to i64
  %t1132 = inttoptr i64 %t1131 to ptr
  call void @intrinsic_println(ptr %t1132)
  %t1133 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.228)
  %t1134 = ptrtoint ptr %t1133 to i64
  %t1135 = inttoptr i64 %t1134 to ptr
  call void @intrinsic_println(ptr %t1135)
  %t1136 = load i64, ptr %local.loss_fast.1064
  store i64 %t1136, ptr %local.best_fixed.1067
  store i64 1, ptr %local.best_name_fast.1068
  %t1137 = load i64, ptr %local.loss_slow.1065
  %t1138 = load i64, ptr %local.best_fixed.1067
  %t1139 = call i64 @"sx_f64_lt"(i64 %t1137, i64 %t1138)
  %t1140 = icmp ne i64 %t1139, 0
  br i1 %t1140, label %then28, label %else28
then28:
  store i64 0, ptr %local.best_name_fast.1068
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1141 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1142 = load i64, ptr %local.loss_s.1066
  %t1143 = load i64, ptr %local.loss_fast.1064
  %t1144 = call i64 @"sx_f64_lt"(i64 %t1142, i64 %t1143)
  %t1145 = icmp ne i64 %t1144, 0
  br i1 %t1145, label %then29, label %else29
then29:
  %t1146 = load i64, ptr %local.loss_s.1066
  %t1147 = load i64, ptr %local.loss_slow.1065
  %t1148 = call i64 @"sx_f64_lt"(i64 %t1146, i64 %t1147)
  %t1149 = icmp ne i64 %t1148, 0
  br i1 %t1149, label %then30, label %else30
then30:
  %t1150 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.229)
  %t1151 = ptrtoint ptr %t1150 to i64
  %t1152 = inttoptr i64 %t1151 to ptr
  call void @intrinsic_println(ptr %t1152)
  %t1153 = call i64 @f64_parse(ptr @.str.exp_s_controller.230)
  store i64 %t1153, ptr %local.improve.1069
  %t1154 = load i64, ptr %local.loss_fast.1064
  %t1155 = load i64, ptr %local.loss_slow.1065
  %t1156 = call i64 @"sx_f64_lt"(i64 %t1154, i64 %t1155)
  %t1157 = icmp ne i64 %t1156, 0
  br i1 %t1157, label %then31, label %else31
then31:
  %t1158 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.231)
  %t1159 = ptrtoint ptr %t1158 to i64
  %t1160 = inttoptr i64 %t1159 to ptr
  call void @intrinsic_print(ptr %t1160)
  %t1161 = load i64, ptr %local.loss_fast.1064
  %t1162 = load i64, ptr %local.loss_s.1066
  %t1163 = call i64 @"sx_f64_sub"(i64 %t1161, i64 %t1162)
  %t1164 = call i64 @"print_f64"(i64 %t1163)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  %t1165 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.232)
  %t1166 = ptrtoint ptr %t1165 to i64
  %t1167 = inttoptr i64 %t1166 to ptr
  call void @intrinsic_print(ptr %t1167)
  %t1168 = load i64, ptr %local.loss_slow.1065
  %t1169 = load i64, ptr %local.loss_s.1066
  %t1170 = call i64 @"sx_f64_sub"(i64 %t1168, i64 %t1169)
  %t1171 = call i64 @"print_f64"(i64 %t1170)
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1172 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1173 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.233)
  %t1174 = ptrtoint ptr %t1173 to i64
  %t1175 = inttoptr i64 %t1174 to ptr
  call void @intrinsic_println(ptr %t1175)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t1176 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.234)
  %t1177 = ptrtoint ptr %t1176 to i64
  %t1178 = inttoptr i64 %t1177 to ptr
  call void @intrinsic_println(ptr %t1178)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1179 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t1180 = load i64, ptr %local.loss_s.1066
  %t1181 = load i64, ptr %local.loss_slow.1065
  %t1182 = call i64 @"sx_f64_lt"(i64 %t1180, i64 %t1181)
  %t1183 = icmp ne i64 %t1182, 0
  br i1 %t1183, label %then32, label %else32
then32:
  %t1184 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.235)
  %t1185 = ptrtoint ptr %t1184 to i64
  %t1186 = inttoptr i64 %t1185 to ptr
  call void @intrinsic_println(ptr %t1186)
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t1187 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.236)
  %t1188 = ptrtoint ptr %t1187 to i64
  %t1189 = inttoptr i64 %t1188 to ptr
  call void @intrinsic_println(ptr %t1189)
  %t1190 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.237)
  %t1191 = ptrtoint ptr %t1190 to i64
  %t1192 = inttoptr i64 %t1191 to ptr
  call void @intrinsic_println(ptr %t1192)
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1193 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1194 = phi i64 [ %t1179, %then29_end ], [ %t1193, %else29_end ]
  %t1195 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.238)
  %t1196 = ptrtoint ptr %t1195 to i64
  %t1197 = inttoptr i64 %t1196 to ptr
  call void @intrinsic_println(ptr %t1197)
  ret i64 0
}

define i64 @"beta_mean"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t1198 = load i64, ptr %local.a
  %t1199 = load i64, ptr %local.a
  %t1200 = load i64, ptr %local.b
  %t1201 = call i64 @"sx_f64_add"(i64 %t1199, i64 %t1200)
  %t1202 = call i64 @"sx_f64_div"(i64 %t1198, i64 %t1201)
  ret i64 %t1202
}

define i64 @"train_beliefs_fixed"(i64 %strength, i64 %obs, i64 %seed, i64 %change_step) nounwind {
entry:
  %local.al_a.1203 = alloca i64
  %local.be_a.1204 = alloca i64
  %local.al_b.1205 = alloca i64
  %local.be_b.1206 = alloca i64
  %local.al_c.1207 = alloca i64
  %local.be_c.1208 = alloca i64
  %local.rng.1209 = alloca i64
  %local.step.1210 = alloca i64
  %local.t_a.1211 = alloca i64
  %local.t_b.1212 = alloca i64
  %local.t_c.1213 = alloca i64
  %local.ea.1214 = alloca i64
  %local.eb.1215 = alloca i64
  %local.ec.1216 = alloca i64
  %local.strength = alloca i64
  store i64 %strength, ptr %local.strength
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %local.change_step = alloca i64
  store i64 %change_step, ptr %local.change_step
  %t1217 = call i64 @f64_parse(ptr @.str.exp_s_controller.239)
  store i64 %t1217, ptr %local.al_a.1203
  %t1218 = call i64 @f64_parse(ptr @.str.exp_s_controller.240)
  store i64 %t1218, ptr %local.be_a.1204
  %t1219 = call i64 @f64_parse(ptr @.str.exp_s_controller.241)
  store i64 %t1219, ptr %local.al_b.1205
  %t1220 = call i64 @f64_parse(ptr @.str.exp_s_controller.242)
  store i64 %t1220, ptr %local.be_b.1206
  %t1221 = call i64 @f64_parse(ptr @.str.exp_s_controller.243)
  store i64 %t1221, ptr %local.al_c.1207
  %t1222 = call i64 @f64_parse(ptr @.str.exp_s_controller.244)
  store i64 %t1222, ptr %local.be_c.1208
  %t1223 = load i64, ptr %local.seed
  store i64 %t1223, ptr %local.rng.1209
  store i64 0, ptr %local.step.1210
  %t1224 = call i64 @f64_parse(ptr @.str.exp_s_controller.245)
  store i64 %t1224, ptr %local.t_a.1211
  %t1225 = call i64 @f64_parse(ptr @.str.exp_s_controller.246)
  store i64 %t1225, ptr %local.t_b.1212
  %t1226 = call i64 @f64_parse(ptr @.str.exp_s_controller.247)
  store i64 %t1226, ptr %local.t_c.1213
  br label %loop33
loop33:
  %t1227 = load i64, ptr %local.step.1210
  %t1228 = load i64, ptr %local.obs
  %t1229 = icmp slt i64 %t1227, %t1228
  %t1230 = zext i1 %t1229 to i64
  %t1231 = icmp ne i64 %t1230, 0
  br i1 %t1231, label %body33, label %endloop33
body33:
  %t1232 = load i64, ptr %local.step.1210
  %t1233 = load i64, ptr %local.change_step
  %t1234 = icmp eq i64 %t1232, %t1233
  %t1235 = zext i1 %t1234 to i64
  %t1236 = icmp ne i64 %t1235, 0
  br i1 %t1236, label %then34, label %else34
then34:
  %t1237 = call i64 @f64_parse(ptr @.str.exp_s_controller.248)
  store i64 %t1237, ptr %local.t_a.1211
  %t1238 = call i64 @f64_parse(ptr @.str.exp_s_controller.249)
  store i64 %t1238, ptr %local.t_b.1212
  %t1239 = call i64 @f64_parse(ptr @.str.exp_s_controller.250)
  store i64 %t1239, ptr %local.t_c.1213
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1240 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1241 = load i64, ptr %local.rng.1209
  %t1242 = call i64 @"lcg_next"(i64 %t1241)
  store i64 %t1242, ptr %local.rng.1209
  %t1243 = load i64, ptr %local.rng.1209
  %t1244 = call i64 @"lcg_f64"(i64 %t1243)
  %t1245 = load i64, ptr %local.t_a.1211
  %t1246 = call i64 @"sx_f64_lt"(i64 %t1244, i64 %t1245)
  %t1247 = icmp ne i64 %t1246, 0
  br i1 %t1247, label %then35, label %else35
then35:
  %t1248 = load i64, ptr %local.al_a.1203
  %t1249 = load i64, ptr %local.strength
  %t1250 = call i64 @"sx_f64_add"(i64 %t1248, i64 %t1249)
  store i64 %t1250, ptr %local.al_a.1203
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t1251 = load i64, ptr %local.be_a.1204
  %t1252 = load i64, ptr %local.strength
  %t1253 = call i64 @"sx_f64_add"(i64 %t1251, i64 %t1252)
  store i64 %t1253, ptr %local.be_a.1204
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1254 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1255 = load i64, ptr %local.rng.1209
  %t1256 = call i64 @"lcg_next"(i64 %t1255)
  store i64 %t1256, ptr %local.rng.1209
  %t1257 = load i64, ptr %local.rng.1209
  %t1258 = call i64 @"lcg_f64"(i64 %t1257)
  %t1259 = load i64, ptr %local.t_b.1212
  %t1260 = call i64 @"sx_f64_lt"(i64 %t1258, i64 %t1259)
  %t1261 = icmp ne i64 %t1260, 0
  br i1 %t1261, label %then36, label %else36
then36:
  %t1262 = load i64, ptr %local.al_b.1205
  %t1263 = load i64, ptr %local.strength
  %t1264 = call i64 @"sx_f64_add"(i64 %t1262, i64 %t1263)
  store i64 %t1264, ptr %local.al_b.1205
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t1265 = load i64, ptr %local.be_b.1206
  %t1266 = load i64, ptr %local.strength
  %t1267 = call i64 @"sx_f64_add"(i64 %t1265, i64 %t1266)
  store i64 %t1267, ptr %local.be_b.1206
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1268 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1269 = load i64, ptr %local.rng.1209
  %t1270 = call i64 @"lcg_next"(i64 %t1269)
  store i64 %t1270, ptr %local.rng.1209
  %t1271 = load i64, ptr %local.rng.1209
  %t1272 = call i64 @"lcg_f64"(i64 %t1271)
  %t1273 = load i64, ptr %local.t_c.1213
  %t1274 = call i64 @"sx_f64_lt"(i64 %t1272, i64 %t1273)
  %t1275 = icmp ne i64 %t1274, 0
  br i1 %t1275, label %then37, label %else37
then37:
  %t1276 = load i64, ptr %local.al_c.1207
  %t1277 = load i64, ptr %local.strength
  %t1278 = call i64 @"sx_f64_add"(i64 %t1276, i64 %t1277)
  store i64 %t1278, ptr %local.al_c.1207
  br label %then37_end
then37_end:
  br label %endif37
else37:
  %t1279 = load i64, ptr %local.be_c.1208
  %t1280 = load i64, ptr %local.strength
  %t1281 = call i64 @"sx_f64_add"(i64 %t1279, i64 %t1280)
  store i64 %t1281, ptr %local.be_c.1208
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1282 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t1283 = load i64, ptr %local.step.1210
  %t1284 = add i64 %t1283, 1
  store i64 %t1284, ptr %local.step.1210
  br label %loop33
endloop33:
  %t1285 = load i64, ptr %local.al_a.1203
  %t1286 = load i64, ptr %local.be_a.1204
  %t1287 = call i64 @"beta_mean"(i64 %t1285, i64 %t1286)
  %t1288 = load i64, ptr %local.t_a.1211
  %t1289 = call i64 @"sx_f64_sub"(i64 %t1287, i64 %t1288)
  store i64 %t1289, ptr %local.ea.1214
  %t1290 = load i64, ptr %local.al_b.1205
  %t1291 = load i64, ptr %local.be_b.1206
  %t1292 = call i64 @"beta_mean"(i64 %t1290, i64 %t1291)
  %t1293 = load i64, ptr %local.t_b.1212
  %t1294 = call i64 @"sx_f64_sub"(i64 %t1292, i64 %t1293)
  store i64 %t1294, ptr %local.eb.1215
  %t1295 = load i64, ptr %local.al_c.1207
  %t1296 = load i64, ptr %local.be_c.1208
  %t1297 = call i64 @"beta_mean"(i64 %t1295, i64 %t1296)
  %t1298 = load i64, ptr %local.t_c.1213
  %t1299 = call i64 @"sx_f64_sub"(i64 %t1297, i64 %t1298)
  store i64 %t1299, ptr %local.ec.1216
  %t1300 = load i64, ptr %local.ea.1214
  %t1301 = load i64, ptr %local.ea.1214
  %t1302 = call i64 @"sx_f64_mul"(i64 %t1300, i64 %t1301)
  %t1303 = load i64, ptr %local.eb.1215
  %t1304 = load i64, ptr %local.eb.1215
  %t1305 = call i64 @"sx_f64_mul"(i64 %t1303, i64 %t1304)
  %t1306 = call i64 @"sx_f64_add"(i64 %t1302, i64 %t1305)
  %t1307 = load i64, ptr %local.ec.1216
  %t1308 = load i64, ptr %local.ec.1216
  %t1309 = call i64 @"sx_f64_mul"(i64 %t1307, i64 %t1308)
  %t1310 = call i64 @"sx_f64_add"(i64 %t1306, i64 %t1309)
  ret i64 %t1310
}

define i64 @"train_beliefs_s_ctrl"(i64 %obs, i64 %seed, i64 %change_step, i64 %verbose) nounwind {
entry:
  %local.al_a.1311 = alloca i64
  %local.be_a.1312 = alloca i64
  %local.al_b.1313 = alloca i64
  %local.be_b.1314 = alloca i64
  %local.al_c.1315 = alloca i64
  %local.be_c.1316 = alloca i64
  %local.rng.1317 = alloca i64
  %local.step.1318 = alloca i64
  %local.t_a.1319 = alloca i64
  %local.t_b.1320 = alloca i64
  %local.t_c.1321 = alloca i64
  %local.prev_err.1322 = alloca i64
  %local.curr_err.1323 = alloca i64
  %local.prev_drift.1324 = alloca i64
  %local.s_val.1325 = alloca i64
  %local.strength.1326 = alloca i64
  %local.ea.1327 = alloca i64
  %local.eb.1328 = alloca i64
  %local.ec.1329 = alloca i64
  %local.drift.1330 = alloca i64
  %local.fa.1331 = alloca i64
  %local.fb.1332 = alloca i64
  %local.fc.1333 = alloca i64
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %local.change_step = alloca i64
  store i64 %change_step, ptr %local.change_step
  %local.verbose = alloca i64
  store i64 %verbose, ptr %local.verbose
  %t1334 = call i64 @f64_parse(ptr @.str.exp_s_controller.251)
  store i64 %t1334, ptr %local.al_a.1311
  %t1335 = call i64 @f64_parse(ptr @.str.exp_s_controller.252)
  store i64 %t1335, ptr %local.be_a.1312
  %t1336 = call i64 @f64_parse(ptr @.str.exp_s_controller.253)
  store i64 %t1336, ptr %local.al_b.1313
  %t1337 = call i64 @f64_parse(ptr @.str.exp_s_controller.254)
  store i64 %t1337, ptr %local.be_b.1314
  %t1338 = call i64 @f64_parse(ptr @.str.exp_s_controller.255)
  store i64 %t1338, ptr %local.al_c.1315
  %t1339 = call i64 @f64_parse(ptr @.str.exp_s_controller.256)
  store i64 %t1339, ptr %local.be_c.1316
  %t1340 = load i64, ptr %local.seed
  store i64 %t1340, ptr %local.rng.1317
  store i64 0, ptr %local.step.1318
  %t1341 = call i64 @f64_parse(ptr @.str.exp_s_controller.257)
  store i64 %t1341, ptr %local.t_a.1319
  %t1342 = call i64 @f64_parse(ptr @.str.exp_s_controller.258)
  store i64 %t1342, ptr %local.t_b.1320
  %t1343 = call i64 @f64_parse(ptr @.str.exp_s_controller.259)
  store i64 %t1343, ptr %local.t_c.1321
  %t1344 = call i64 @f64_parse(ptr @.str.exp_s_controller.260)
  store i64 %t1344, ptr %local.prev_err.1322
  %t1345 = call i64 @f64_parse(ptr @.str.exp_s_controller.261)
  store i64 %t1345, ptr %local.curr_err.1323
  %t1346 = call i64 @f64_parse(ptr @.str.exp_s_controller.262)
  store i64 %t1346, ptr %local.prev_drift.1324
  %t1347 = call i64 @f64_parse(ptr @.str.exp_s_controller.263)
  store i64 %t1347, ptr %local.s_val.1325
  %t1348 = call i64 @f64_parse(ptr @.str.exp_s_controller.264)
  store i64 %t1348, ptr %local.strength.1326
  br label %loop38
loop38:
  %t1349 = load i64, ptr %local.step.1318
  %t1350 = load i64, ptr %local.obs
  %t1351 = icmp slt i64 %t1349, %t1350
  %t1352 = zext i1 %t1351 to i64
  %t1353 = icmp ne i64 %t1352, 0
  br i1 %t1353, label %body38, label %endloop38
body38:
  %t1354 = load i64, ptr %local.step.1318
  %t1355 = load i64, ptr %local.change_step
  %t1356 = icmp eq i64 %t1354, %t1355
  %t1357 = zext i1 %t1356 to i64
  %t1358 = icmp ne i64 %t1357, 0
  br i1 %t1358, label %then39, label %else39
then39:
  %t1359 = call i64 @f64_parse(ptr @.str.exp_s_controller.265)
  store i64 %t1359, ptr %local.t_a.1319
  %t1360 = call i64 @f64_parse(ptr @.str.exp_s_controller.266)
  store i64 %t1360, ptr %local.t_b.1320
  %t1361 = call i64 @f64_parse(ptr @.str.exp_s_controller.267)
  store i64 %t1361, ptr %local.t_c.1321
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1362 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1363 = load i64, ptr %local.al_a.1311
  %t1364 = load i64, ptr %local.be_a.1312
  %t1365 = call i64 @"beta_mean"(i64 %t1363, i64 %t1364)
  %t1366 = load i64, ptr %local.t_a.1319
  %t1367 = call i64 @"sx_f64_sub"(i64 %t1365, i64 %t1366)
  store i64 %t1367, ptr %local.ea.1327
  %t1368 = load i64, ptr %local.al_b.1313
  %t1369 = load i64, ptr %local.be_b.1314
  %t1370 = call i64 @"beta_mean"(i64 %t1368, i64 %t1369)
  %t1371 = load i64, ptr %local.t_b.1320
  %t1372 = call i64 @"sx_f64_sub"(i64 %t1370, i64 %t1371)
  store i64 %t1372, ptr %local.eb.1328
  %t1373 = load i64, ptr %local.al_c.1315
  %t1374 = load i64, ptr %local.be_c.1316
  %t1375 = call i64 @"beta_mean"(i64 %t1373, i64 %t1374)
  %t1376 = load i64, ptr %local.t_c.1321
  %t1377 = call i64 @"sx_f64_sub"(i64 %t1375, i64 %t1376)
  store i64 %t1377, ptr %local.ec.1329
  %t1378 = load i64, ptr %local.ea.1327
  %t1379 = load i64, ptr %local.ea.1327
  %t1380 = call i64 @"sx_f64_mul"(i64 %t1378, i64 %t1379)
  %t1381 = load i64, ptr %local.eb.1328
  %t1382 = load i64, ptr %local.eb.1328
  %t1383 = call i64 @"sx_f64_mul"(i64 %t1381, i64 %t1382)
  %t1384 = call i64 @"sx_f64_add"(i64 %t1380, i64 %t1383)
  %t1385 = load i64, ptr %local.ec.1329
  %t1386 = load i64, ptr %local.ec.1329
  %t1387 = call i64 @"sx_f64_mul"(i64 %t1385, i64 %t1386)
  %t1388 = call i64 @"sx_f64_add"(i64 %t1384, i64 %t1387)
  store i64 %t1388, ptr %local.curr_err.1323
  %t1389 = load i64, ptr %local.step.1318
  %t1390 = icmp sgt i64 %t1389, 1
  %t1391 = zext i1 %t1390 to i64
  %t1392 = icmp ne i64 %t1391, 0
  br i1 %t1392, label %then40, label %else40
then40:
  %t1393 = load i64, ptr %local.curr_err.1323
  %t1394 = load i64, ptr %local.prev_err.1322
  %t1395 = call i64 @"sx_f64_sub"(i64 %t1393, i64 %t1394)
  %t1396 = call i64 @"abs_f64"(i64 %t1395)
  store i64 %t1396, ptr %local.drift.1330
  %t1397 = load i64, ptr %local.prev_drift.1324
  %t1398 = call i64 @f64_parse(ptr @.str.exp_s_controller.268)
  %t1399 = call i64 @"sx_f64_gt"(i64 %t1397, i64 %t1398)
  %t1400 = icmp ne i64 %t1399, 0
  br i1 %t1400, label %then41, label %else41
then41:
  %t1401 = call i64 @f64_parse(ptr @.str.exp_s_controller.269)
  %t1402 = load i64, ptr %local.drift.1330
  %t1403 = load i64, ptr %local.prev_drift.1324
  %t1404 = call i64 @"sx_f64_div"(i64 %t1402, i64 %t1403)
  %t1405 = call i64 @"sx_f64_sub"(i64 %t1401, i64 %t1404)
  store i64 %t1405, ptr %local.s_val.1325
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1406 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t1407 = call i64 @f64_parse(ptr @.str.exp_s_controller.270)
  %t1408 = call i64 @f64_parse(ptr @.str.exp_s_controller.271)
  %t1409 = load i64, ptr %local.s_val.1325
  %t1410 = call i64 @"sx_f64_add"(i64 %t1408, i64 %t1409)
  %t1411 = call i64 @"sx_f64_sub"(i64 %t1407, i64 %t1410)
  %t1412 = call i64 @f64_parse(ptr @.str.exp_s_controller.272)
  %t1413 = call i64 @f64_parse(ptr @.str.exp_s_controller.273)
  %t1414 = call i64 @"clamp"(i64 %t1411, i64 %t1412, i64 %t1413)
  store i64 %t1414, ptr %local.strength.1326
  %t1415 = load i64, ptr %local.drift.1330
  store i64 %t1415, ptr %local.prev_drift.1324
  %t1416 = load i64, ptr %local.prev_drift.1324
  %t1417 = call i64 @f64_parse(ptr @.str.exp_s_controller.274)
  %t1418 = call i64 @"sx_f64_lt"(i64 %t1416, i64 %t1417)
  %t1419 = icmp ne i64 %t1418, 0
  br i1 %t1419, label %then42, label %else42
then42:
  %t1420 = call i64 @f64_parse(ptr @.str.exp_s_controller.275)
  store i64 %t1420, ptr %local.prev_drift.1324
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1421 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1422 = phi i64 [ %t1421, %then40_end ], [ 0, %else40_end ]
  %t1423 = load i64, ptr %local.curr_err.1323
  store i64 %t1423, ptr %local.prev_err.1322
  %t1424 = load i64, ptr %local.rng.1317
  %t1425 = call i64 @"lcg_next"(i64 %t1424)
  store i64 %t1425, ptr %local.rng.1317
  %t1426 = load i64, ptr %local.rng.1317
  %t1427 = call i64 @"lcg_f64"(i64 %t1426)
  %t1428 = load i64, ptr %local.t_a.1319
  %t1429 = call i64 @"sx_f64_lt"(i64 %t1427, i64 %t1428)
  %t1430 = icmp ne i64 %t1429, 0
  br i1 %t1430, label %then43, label %else43
then43:
  %t1431 = load i64, ptr %local.al_a.1311
  %t1432 = load i64, ptr %local.strength.1326
  %t1433 = call i64 @"sx_f64_add"(i64 %t1431, i64 %t1432)
  store i64 %t1433, ptr %local.al_a.1311
  br label %then43_end
then43_end:
  br label %endif43
else43:
  %t1434 = load i64, ptr %local.be_a.1312
  %t1435 = load i64, ptr %local.strength.1326
  %t1436 = call i64 @"sx_f64_add"(i64 %t1434, i64 %t1435)
  store i64 %t1436, ptr %local.be_a.1312
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1437 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t1438 = load i64, ptr %local.rng.1317
  %t1439 = call i64 @"lcg_next"(i64 %t1438)
  store i64 %t1439, ptr %local.rng.1317
  %t1440 = load i64, ptr %local.rng.1317
  %t1441 = call i64 @"lcg_f64"(i64 %t1440)
  %t1442 = load i64, ptr %local.t_b.1320
  %t1443 = call i64 @"sx_f64_lt"(i64 %t1441, i64 %t1442)
  %t1444 = icmp ne i64 %t1443, 0
  br i1 %t1444, label %then44, label %else44
then44:
  %t1445 = load i64, ptr %local.al_b.1313
  %t1446 = load i64, ptr %local.strength.1326
  %t1447 = call i64 @"sx_f64_add"(i64 %t1445, i64 %t1446)
  store i64 %t1447, ptr %local.al_b.1313
  br label %then44_end
then44_end:
  br label %endif44
else44:
  %t1448 = load i64, ptr %local.be_b.1314
  %t1449 = load i64, ptr %local.strength.1326
  %t1450 = call i64 @"sx_f64_add"(i64 %t1448, i64 %t1449)
  store i64 %t1450, ptr %local.be_b.1314
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1451 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t1452 = load i64, ptr %local.rng.1317
  %t1453 = call i64 @"lcg_next"(i64 %t1452)
  store i64 %t1453, ptr %local.rng.1317
  %t1454 = load i64, ptr %local.rng.1317
  %t1455 = call i64 @"lcg_f64"(i64 %t1454)
  %t1456 = load i64, ptr %local.t_c.1321
  %t1457 = call i64 @"sx_f64_lt"(i64 %t1455, i64 %t1456)
  %t1458 = icmp ne i64 %t1457, 0
  br i1 %t1458, label %then45, label %else45
then45:
  %t1459 = load i64, ptr %local.al_c.1315
  %t1460 = load i64, ptr %local.strength.1326
  %t1461 = call i64 @"sx_f64_add"(i64 %t1459, i64 %t1460)
  store i64 %t1461, ptr %local.al_c.1315
  br label %then45_end
then45_end:
  br label %endif45
else45:
  %t1462 = load i64, ptr %local.be_c.1316
  %t1463 = load i64, ptr %local.strength.1326
  %t1464 = call i64 @"sx_f64_add"(i64 %t1462, i64 %t1463)
  store i64 %t1464, ptr %local.be_c.1316
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1465 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t1466 = load i64, ptr %local.verbose
  %t1467 = icmp eq i64 %t1466, 1
  %t1468 = zext i1 %t1467 to i64
  %t1469 = icmp ne i64 %t1468, 0
  br i1 %t1469, label %then46, label %else46
then46:
  %t1470 = load i64, ptr %local.step.1318
  %t1471 = icmp eq i64 %t1470, 50
  %t1472 = zext i1 %t1471 to i64
  %t1473 = icmp ne i64 %t1472, 0
  br i1 %t1473, label %then47, label %else47
then47:
  %t1474 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.276)
  %t1475 = ptrtoint ptr %t1474 to i64
  %t1476 = inttoptr i64 %t1475 to ptr
  call void @intrinsic_print(ptr %t1476)
  %t1477 = load i64, ptr %local.s_val.1325
  %t1478 = call i64 @"print_f64"(i64 %t1477)
  %t1479 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.277)
  %t1480 = ptrtoint ptr %t1479 to i64
  %t1481 = inttoptr i64 %t1480 to ptr
  call void @intrinsic_print(ptr %t1481)
  %t1482 = load i64, ptr %local.strength.1326
  %t1483 = call i64 @"print_f64"(i64 %t1482)
  %t1484 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.278)
  %t1485 = ptrtoint ptr %t1484 to i64
  %t1486 = inttoptr i64 %t1485 to ptr
  call void @intrinsic_print(ptr %t1486)
  %t1487 = load i64, ptr %local.curr_err.1323
  %t1488 = call i64 @"print_f64"(i64 %t1487)
  %t1489 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.279)
  %t1490 = ptrtoint ptr %t1489 to i64
  %t1491 = inttoptr i64 %t1490 to ptr
  call void @intrinsic_println(ptr %t1491)
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1492 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t1493 = load i64, ptr %local.step.1318
  %t1494 = icmp eq i64 %t1493, 101
  %t1495 = zext i1 %t1494 to i64
  %t1496 = icmp ne i64 %t1495, 0
  br i1 %t1496, label %then48, label %else48
then48:
  %t1497 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.280)
  %t1498 = ptrtoint ptr %t1497 to i64
  %t1499 = inttoptr i64 %t1498 to ptr
  call void @intrinsic_print(ptr %t1499)
  %t1500 = load i64, ptr %local.s_val.1325
  %t1501 = call i64 @"print_f64"(i64 %t1500)
  %t1502 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.281)
  %t1503 = ptrtoint ptr %t1502 to i64
  %t1504 = inttoptr i64 %t1503 to ptr
  call void @intrinsic_print(ptr %t1504)
  %t1505 = load i64, ptr %local.strength.1326
  %t1506 = call i64 @"print_f64"(i64 %t1505)
  %t1507 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.282)
  %t1508 = ptrtoint ptr %t1507 to i64
  %t1509 = inttoptr i64 %t1508 to ptr
  call void @intrinsic_print(ptr %t1509)
  %t1510 = load i64, ptr %local.curr_err.1323
  %t1511 = call i64 @"print_f64"(i64 %t1510)
  %t1512 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.283)
  %t1513 = ptrtoint ptr %t1512 to i64
  %t1514 = inttoptr i64 %t1513 to ptr
  call void @intrinsic_println(ptr %t1514)
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1515 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1516 = load i64, ptr %local.step.1318
  %t1517 = icmp eq i64 %t1516, 120
  %t1518 = zext i1 %t1517 to i64
  %t1519 = icmp ne i64 %t1518, 0
  br i1 %t1519, label %then49, label %else49
then49:
  %t1520 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.284)
  %t1521 = ptrtoint ptr %t1520 to i64
  %t1522 = inttoptr i64 %t1521 to ptr
  call void @intrinsic_print(ptr %t1522)
  %t1523 = load i64, ptr %local.s_val.1325
  %t1524 = call i64 @"print_f64"(i64 %t1523)
  %t1525 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.285)
  %t1526 = ptrtoint ptr %t1525 to i64
  %t1527 = inttoptr i64 %t1526 to ptr
  call void @intrinsic_print(ptr %t1527)
  %t1528 = load i64, ptr %local.strength.1326
  %t1529 = call i64 @"print_f64"(i64 %t1528)
  %t1530 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.286)
  %t1531 = ptrtoint ptr %t1530 to i64
  %t1532 = inttoptr i64 %t1531 to ptr
  call void @intrinsic_print(ptr %t1532)
  %t1533 = load i64, ptr %local.curr_err.1323
  %t1534 = call i64 @"print_f64"(i64 %t1533)
  %t1535 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.287)
  %t1536 = ptrtoint ptr %t1535 to i64
  %t1537 = inttoptr i64 %t1536 to ptr
  call void @intrinsic_println(ptr %t1537)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1538 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t1539 = load i64, ptr %local.step.1318
  %t1540 = icmp eq i64 %t1539, 199
  %t1541 = zext i1 %t1540 to i64
  %t1542 = icmp ne i64 %t1541, 0
  br i1 %t1542, label %then50, label %else50
then50:
  %t1543 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.288)
  %t1544 = ptrtoint ptr %t1543 to i64
  %t1545 = inttoptr i64 %t1544 to ptr
  call void @intrinsic_print(ptr %t1545)
  %t1546 = load i64, ptr %local.s_val.1325
  %t1547 = call i64 @"print_f64"(i64 %t1546)
  %t1548 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.289)
  %t1549 = ptrtoint ptr %t1548 to i64
  %t1550 = inttoptr i64 %t1549 to ptr
  call void @intrinsic_print(ptr %t1550)
  %t1551 = load i64, ptr %local.strength.1326
  %t1552 = call i64 @"print_f64"(i64 %t1551)
  %t1553 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.290)
  %t1554 = ptrtoint ptr %t1553 to i64
  %t1555 = inttoptr i64 %t1554 to ptr
  call void @intrinsic_print(ptr %t1555)
  %t1556 = load i64, ptr %local.curr_err.1323
  %t1557 = call i64 @"print_f64"(i64 %t1556)
  %t1558 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.291)
  %t1559 = ptrtoint ptr %t1558 to i64
  %t1560 = inttoptr i64 %t1559 to ptr
  call void @intrinsic_println(ptr %t1560)
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1561 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1562 = phi i64 [ %t1561, %then46_end ], [ 0, %else46_end ]
  %t1563 = load i64, ptr %local.step.1318
  %t1564 = add i64 %t1563, 1
  store i64 %t1564, ptr %local.step.1318
  br label %loop38
endloop38:
  %t1565 = load i64, ptr %local.al_a.1311
  %t1566 = load i64, ptr %local.be_a.1312
  %t1567 = call i64 @"beta_mean"(i64 %t1565, i64 %t1566)
  %t1568 = load i64, ptr %local.t_a.1319
  %t1569 = call i64 @"sx_f64_sub"(i64 %t1567, i64 %t1568)
  store i64 %t1569, ptr %local.fa.1331
  %t1570 = load i64, ptr %local.al_b.1313
  %t1571 = load i64, ptr %local.be_b.1314
  %t1572 = call i64 @"beta_mean"(i64 %t1570, i64 %t1571)
  %t1573 = load i64, ptr %local.t_b.1320
  %t1574 = call i64 @"sx_f64_sub"(i64 %t1572, i64 %t1573)
  store i64 %t1574, ptr %local.fb.1332
  %t1575 = load i64, ptr %local.al_c.1315
  %t1576 = load i64, ptr %local.be_c.1316
  %t1577 = call i64 @"beta_mean"(i64 %t1575, i64 %t1576)
  %t1578 = load i64, ptr %local.t_c.1321
  %t1579 = call i64 @"sx_f64_sub"(i64 %t1577, i64 %t1578)
  store i64 %t1579, ptr %local.fc.1333
  %t1580 = load i64, ptr %local.fa.1331
  %t1581 = load i64, ptr %local.fa.1331
  %t1582 = call i64 @"sx_f64_mul"(i64 %t1580, i64 %t1581)
  %t1583 = load i64, ptr %local.fb.1332
  %t1584 = load i64, ptr %local.fb.1332
  %t1585 = call i64 @"sx_f64_mul"(i64 %t1583, i64 %t1584)
  %t1586 = call i64 @"sx_f64_add"(i64 %t1582, i64 %t1585)
  %t1587 = load i64, ptr %local.fc.1333
  %t1588 = load i64, ptr %local.fc.1333
  %t1589 = call i64 @"sx_f64_mul"(i64 %t1587, i64 %t1588)
  %t1590 = call i64 @"sx_f64_add"(i64 %t1586, i64 %t1589)
  ret i64 %t1590
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.obs.1591 = alloca i64
  %local.change.1592 = alloca i64
  %local.fix_1.1593 = alloca i64
  %local.fix_2.1594 = alloca i64
  %local.fix_3.1595 = alloca i64
  %local.loss_fixed.1596 = alloca i64
  %local.sc_1.1597 = alloca i64
  %local.sc_2.1598 = alloca i64
  %local.sc_3.1599 = alloca i64
  %local.loss_s.1600 = alloca i64
  %local.hf_1.1601 = alloca i64
  %local.hf_2.1602 = alloca i64
  %local.hf_3.1603 = alloca i64
  %local.loss_high.1604 = alloca i64
  %local.improvement.1605 = alloca i64
  %t1606 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.292)
  %t1607 = ptrtoint ptr %t1606 to i64
  %t1608 = inttoptr i64 %t1607 to ptr
  call void @intrinsic_println(ptr %t1608)
  %t1609 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.293)
  %t1610 = ptrtoint ptr %t1609 to i64
  %t1611 = inttoptr i64 %t1610 to ptr
  call void @intrinsic_println(ptr %t1611)
  %t1612 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.294)
  %t1613 = ptrtoint ptr %t1612 to i64
  %t1614 = inttoptr i64 %t1613 to ptr
  call void @intrinsic_println(ptr %t1614)
  %t1615 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.295)
  %t1616 = ptrtoint ptr %t1615 to i64
  %t1617 = inttoptr i64 %t1616 to ptr
  call void @intrinsic_println(ptr %t1617)
  %t1618 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.296)
  %t1619 = ptrtoint ptr %t1618 to i64
  %t1620 = inttoptr i64 %t1619 to ptr
  call void @intrinsic_println(ptr %t1620)
  %t1621 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.297)
  %t1622 = ptrtoint ptr %t1621 to i64
  %t1623 = inttoptr i64 %t1622 to ptr
  call void @intrinsic_println(ptr %t1623)
  %t1624 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.298)
  %t1625 = ptrtoint ptr %t1624 to i64
  %t1626 = inttoptr i64 %t1625 to ptr
  call void @intrinsic_println(ptr %t1626)
  %t1627 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.299)
  %t1628 = ptrtoint ptr %t1627 to i64
  %t1629 = inttoptr i64 %t1628 to ptr
  call void @intrinsic_println(ptr %t1629)
  store i64 200, ptr %local.obs.1591
  store i64 100, ptr %local.change.1592
  %t1630 = call i64 @f64_parse(ptr @.str.exp_s_controller.300)
  %t1631 = load i64, ptr %local.obs.1591
  %t1632 = load i64, ptr %local.change.1592
  %t1633 = call i64 @"train_beliefs_fixed"(i64 %t1630, i64 %t1631, i64 42, i64 %t1632)
  store i64 %t1633, ptr %local.fix_1.1593
  %t1634 = call i64 @f64_parse(ptr @.str.exp_s_controller.301)
  %t1635 = load i64, ptr %local.obs.1591
  %t1636 = load i64, ptr %local.change.1592
  %t1637 = call i64 @"train_beliefs_fixed"(i64 %t1634, i64 %t1635, i64 137, i64 %t1636)
  store i64 %t1637, ptr %local.fix_2.1594
  %t1638 = call i64 @f64_parse(ptr @.str.exp_s_controller.302)
  %t1639 = load i64, ptr %local.obs.1591
  %t1640 = load i64, ptr %local.change.1592
  %t1641 = call i64 @"train_beliefs_fixed"(i64 %t1638, i64 %t1639, i64 999, i64 %t1640)
  store i64 %t1641, ptr %local.fix_3.1595
  %t1642 = load i64, ptr %local.fix_1.1593
  %t1643 = load i64, ptr %local.fix_2.1594
  %t1644 = call i64 @"sx_f64_add"(i64 %t1642, i64 %t1643)
  %t1645 = load i64, ptr %local.fix_3.1595
  %t1646 = call i64 @"sx_f64_add"(i64 %t1644, i64 %t1645)
  %t1647 = call i64 @f64_parse(ptr @.str.exp_s_controller.303)
  %t1648 = call i64 @"sx_f64_div"(i64 %t1646, i64 %t1647)
  store i64 %t1648, ptr %local.loss_fixed.1596
  %t1649 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.304)
  %t1650 = ptrtoint ptr %t1649 to i64
  %t1651 = inttoptr i64 %t1650 to ptr
  call void @intrinsic_print(ptr %t1651)
  %t1652 = load i64, ptr %local.loss_fixed.1596
  %t1653 = call i64 @"print_f64"(i64 %t1652)
  %t1654 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.305)
  %t1655 = ptrtoint ptr %t1654 to i64
  %t1656 = inttoptr i64 %t1655 to ptr
  call void @intrinsic_println(ptr %t1656)
  %t1657 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.306)
  %t1658 = ptrtoint ptr %t1657 to i64
  %t1659 = inttoptr i64 %t1658 to ptr
  call void @intrinsic_println(ptr %t1659)
  %t1660 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.307)
  %t1661 = ptrtoint ptr %t1660 to i64
  %t1662 = inttoptr i64 %t1661 to ptr
  call void @intrinsic_println(ptr %t1662)
  %t1663 = load i64, ptr %local.obs.1591
  %t1664 = load i64, ptr %local.change.1592
  %t1665 = call i64 @"train_beliefs_s_ctrl"(i64 %t1663, i64 42, i64 %t1664, i64 1)
  store i64 %t1665, ptr %local.sc_1.1597
  %t1666 = load i64, ptr %local.obs.1591
  %t1667 = load i64, ptr %local.change.1592
  %t1668 = call i64 @"train_beliefs_s_ctrl"(i64 %t1666, i64 137, i64 %t1667, i64 0)
  store i64 %t1668, ptr %local.sc_2.1598
  %t1669 = load i64, ptr %local.obs.1591
  %t1670 = load i64, ptr %local.change.1592
  %t1671 = call i64 @"train_beliefs_s_ctrl"(i64 %t1669, i64 999, i64 %t1670, i64 0)
  store i64 %t1671, ptr %local.sc_3.1599
  %t1672 = load i64, ptr %local.sc_1.1597
  %t1673 = load i64, ptr %local.sc_2.1598
  %t1674 = call i64 @"sx_f64_add"(i64 %t1672, i64 %t1673)
  %t1675 = load i64, ptr %local.sc_3.1599
  %t1676 = call i64 @"sx_f64_add"(i64 %t1674, i64 %t1675)
  %t1677 = call i64 @f64_parse(ptr @.str.exp_s_controller.308)
  %t1678 = call i64 @"sx_f64_div"(i64 %t1676, i64 %t1677)
  store i64 %t1678, ptr %local.loss_s.1600
  %t1679 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.309)
  %t1680 = ptrtoint ptr %t1679 to i64
  %t1681 = inttoptr i64 %t1680 to ptr
  call void @intrinsic_println(ptr %t1681)
  %t1682 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.310)
  %t1683 = ptrtoint ptr %t1682 to i64
  %t1684 = inttoptr i64 %t1683 to ptr
  call void @intrinsic_print(ptr %t1684)
  %t1685 = load i64, ptr %local.loss_s.1600
  %t1686 = call i64 @"print_f64"(i64 %t1685)
  %t1687 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.311)
  %t1688 = ptrtoint ptr %t1687 to i64
  %t1689 = inttoptr i64 %t1688 to ptr
  call void @intrinsic_println(ptr %t1689)
  %t1690 = call i64 @f64_parse(ptr @.str.exp_s_controller.312)
  %t1691 = load i64, ptr %local.obs.1591
  %t1692 = load i64, ptr %local.change.1592
  %t1693 = call i64 @"train_beliefs_fixed"(i64 %t1690, i64 %t1691, i64 42, i64 %t1692)
  store i64 %t1693, ptr %local.hf_1.1601
  %t1694 = call i64 @f64_parse(ptr @.str.exp_s_controller.313)
  %t1695 = load i64, ptr %local.obs.1591
  %t1696 = load i64, ptr %local.change.1592
  %t1697 = call i64 @"train_beliefs_fixed"(i64 %t1694, i64 %t1695, i64 137, i64 %t1696)
  store i64 %t1697, ptr %local.hf_2.1602
  %t1698 = call i64 @f64_parse(ptr @.str.exp_s_controller.314)
  %t1699 = load i64, ptr %local.obs.1591
  %t1700 = load i64, ptr %local.change.1592
  %t1701 = call i64 @"train_beliefs_fixed"(i64 %t1698, i64 %t1699, i64 999, i64 %t1700)
  store i64 %t1701, ptr %local.hf_3.1603
  %t1702 = load i64, ptr %local.hf_1.1601
  %t1703 = load i64, ptr %local.hf_2.1602
  %t1704 = call i64 @"sx_f64_add"(i64 %t1702, i64 %t1703)
  %t1705 = load i64, ptr %local.hf_3.1603
  %t1706 = call i64 @"sx_f64_add"(i64 %t1704, i64 %t1705)
  %t1707 = call i64 @f64_parse(ptr @.str.exp_s_controller.315)
  %t1708 = call i64 @"sx_f64_div"(i64 %t1706, i64 %t1707)
  store i64 %t1708, ptr %local.loss_high.1604
  %t1709 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.316)
  %t1710 = ptrtoint ptr %t1709 to i64
  %t1711 = inttoptr i64 %t1710 to ptr
  call void @intrinsic_print(ptr %t1711)
  %t1712 = load i64, ptr %local.loss_high.1604
  %t1713 = call i64 @"print_f64"(i64 %t1712)
  %t1714 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.317)
  %t1715 = ptrtoint ptr %t1714 to i64
  %t1716 = inttoptr i64 %t1715 to ptr
  call void @intrinsic_println(ptr %t1716)
  %t1717 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.318)
  %t1718 = ptrtoint ptr %t1717 to i64
  %t1719 = inttoptr i64 %t1718 to ptr
  call void @intrinsic_println(ptr %t1719)
  %t1720 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.319)
  %t1721 = ptrtoint ptr %t1720 to i64
  %t1722 = inttoptr i64 %t1721 to ptr
  call void @intrinsic_println(ptr %t1722)
  %t1723 = load i64, ptr %local.loss_s.1600
  %t1724 = load i64, ptr %local.loss_fixed.1596
  %t1725 = call i64 @"sx_f64_lt"(i64 %t1723, i64 %t1724)
  %t1726 = icmp ne i64 %t1725, 0
  br i1 %t1726, label %then51, label %else51
then51:
  %t1727 = load i64, ptr %local.loss_s.1600
  %t1728 = load i64, ptr %local.loss_high.1604
  %t1729 = call i64 @"sx_f64_lt"(i64 %t1727, i64 %t1728)
  %t1730 = icmp ne i64 %t1729, 0
  br i1 %t1730, label %then52, label %else52
then52:
  %t1731 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.320)
  %t1732 = ptrtoint ptr %t1731 to i64
  %t1733 = inttoptr i64 %t1732 to ptr
  call void @intrinsic_println(ptr %t1733)
  br label %then52_end
then52_end:
  br label %endif52
else52:
  %t1734 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.321)
  %t1735 = ptrtoint ptr %t1734 to i64
  %t1736 = inttoptr i64 %t1735 to ptr
  call void @intrinsic_println(ptr %t1736)
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t1737 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  br label %then51_end
then51_end:
  br label %endif51
else51:
  %t1738 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.322)
  %t1739 = ptrtoint ptr %t1738 to i64
  %t1740 = inttoptr i64 %t1739 to ptr
  call void @intrinsic_println(ptr %t1740)
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1741 = phi i64 [ %t1737, %then51_end ], [ 0, %else51_end ]
  %t1742 = load i64, ptr %local.loss_fixed.1596
  %t1743 = load i64, ptr %local.loss_s.1600
  %t1744 = call i64 @"sx_f64_sub"(i64 %t1742, i64 %t1743)
  %t1745 = load i64, ptr %local.loss_fixed.1596
  %t1746 = call i64 @f64_parse(ptr @.str.exp_s_controller.323)
  %t1747 = call i64 @"sx_f64_add"(i64 %t1745, i64 %t1746)
  %t1748 = call i64 @"sx_f64_div"(i64 %t1744, i64 %t1747)
  store i64 %t1748, ptr %local.improvement.1605
  %t1749 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.324)
  %t1750 = ptrtoint ptr %t1749 to i64
  %t1751 = inttoptr i64 %t1750 to ptr
  call void @intrinsic_print(ptr %t1751)
  %t1752 = load i64, ptr %local.improvement.1605
  %t1753 = call i64 @"print_f64"(i64 %t1752)
  %t1754 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.325)
  %t1755 = ptrtoint ptr %t1754 to i64
  %t1756 = inttoptr i64 %t1755 to ptr
  call void @intrinsic_println(ptr %t1756)
  %t1757 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.326)
  %t1758 = ptrtoint ptr %t1757 to i64
  %t1759 = inttoptr i64 %t1758 to ptr
  call void @intrinsic_println(ptr %t1759)
  ret i64 0
}

define i64 @"loss_a4"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t1760 = load i64, ptr %local.w0
  %t1761 = call i64 @f64_parse(ptr @.str.exp_s_controller.327)
  %t1762 = call i64 @"sx_f64_sub"(i64 %t1760, i64 %t1761)
  %t1763 = load i64, ptr %local.w0
  %t1764 = call i64 @f64_parse(ptr @.str.exp_s_controller.328)
  %t1765 = call i64 @"sx_f64_sub"(i64 %t1763, i64 %t1764)
  %t1766 = call i64 @"sx_f64_mul"(i64 %t1762, i64 %t1765)
  %t1767 = load i64, ptr %local.w1
  %t1768 = call i64 @f64_parse(ptr @.str.exp_s_controller.329)
  %t1769 = call i64 @"sx_f64_sub"(i64 %t1767, i64 %t1768)
  %t1770 = load i64, ptr %local.w1
  %t1771 = call i64 @f64_parse(ptr @.str.exp_s_controller.330)
  %t1772 = call i64 @"sx_f64_sub"(i64 %t1770, i64 %t1771)
  %t1773 = call i64 @"sx_f64_mul"(i64 %t1769, i64 %t1772)
  %t1774 = call i64 @"sx_f64_add"(i64 %t1766, i64 %t1773)
  %t1775 = load i64, ptr %local.w2
  %t1776 = call i64 @f64_parse(ptr @.str.exp_s_controller.331)
  %t1777 = call i64 @"sx_f64_sub"(i64 %t1775, i64 %t1776)
  %t1778 = load i64, ptr %local.w2
  %t1779 = call i64 @f64_parse(ptr @.str.exp_s_controller.332)
  %t1780 = call i64 @"sx_f64_sub"(i64 %t1778, i64 %t1779)
  %t1781 = call i64 @"sx_f64_mul"(i64 %t1777, i64 %t1780)
  %t1782 = call i64 @"sx_f64_add"(i64 %t1774, i64 %t1781)
  %t1783 = load i64, ptr %local.w3
  %t1784 = call i64 @f64_parse(ptr @.str.exp_s_controller.333)
  %t1785 = call i64 @"sx_f64_add"(i64 %t1783, i64 %t1784)
  %t1786 = load i64, ptr %local.w3
  %t1787 = call i64 @f64_parse(ptr @.str.exp_s_controller.334)
  %t1788 = call i64 @"sx_f64_add"(i64 %t1786, i64 %t1787)
  %t1789 = call i64 @"sx_f64_mul"(i64 %t1785, i64 %t1788)
  %t1790 = call i64 @"sx_f64_add"(i64 %t1782, i64 %t1789)
  ret i64 %t1790
}

define i64 @"loss_b4"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t1791 = load i64, ptr %local.w0
  %t1792 = call i64 @f64_parse(ptr @.str.exp_s_controller.335)
  %t1793 = call i64 @"sx_f64_add"(i64 %t1791, i64 %t1792)
  %t1794 = load i64, ptr %local.w0
  %t1795 = call i64 @f64_parse(ptr @.str.exp_s_controller.336)
  %t1796 = call i64 @"sx_f64_add"(i64 %t1794, i64 %t1795)
  %t1797 = call i64 @"sx_f64_mul"(i64 %t1793, i64 %t1796)
  %t1798 = load i64, ptr %local.w1
  %t1799 = call i64 @f64_parse(ptr @.str.exp_s_controller.337)
  %t1800 = call i64 @"sx_f64_sub"(i64 %t1798, i64 %t1799)
  %t1801 = load i64, ptr %local.w1
  %t1802 = call i64 @f64_parse(ptr @.str.exp_s_controller.338)
  %t1803 = call i64 @"sx_f64_sub"(i64 %t1801, i64 %t1802)
  %t1804 = call i64 @"sx_f64_mul"(i64 %t1800, i64 %t1803)
  %t1805 = call i64 @"sx_f64_add"(i64 %t1797, i64 %t1804)
  %t1806 = load i64, ptr %local.w2
  %t1807 = call i64 @f64_parse(ptr @.str.exp_s_controller.339)
  %t1808 = call i64 @"sx_f64_add"(i64 %t1806, i64 %t1807)
  %t1809 = load i64, ptr %local.w2
  %t1810 = call i64 @f64_parse(ptr @.str.exp_s_controller.340)
  %t1811 = call i64 @"sx_f64_add"(i64 %t1809, i64 %t1810)
  %t1812 = call i64 @"sx_f64_mul"(i64 %t1808, i64 %t1811)
  %t1813 = call i64 @"sx_f64_add"(i64 %t1805, i64 %t1812)
  %t1814 = load i64, ptr %local.w3
  %t1815 = call i64 @f64_parse(ptr @.str.exp_s_controller.341)
  %t1816 = call i64 @"sx_f64_sub"(i64 %t1814, i64 %t1815)
  %t1817 = load i64, ptr %local.w3
  %t1818 = call i64 @f64_parse(ptr @.str.exp_s_controller.342)
  %t1819 = call i64 @"sx_f64_sub"(i64 %t1817, i64 %t1818)
  %t1820 = call i64 @"sx_f64_mul"(i64 %t1816, i64 %t1819)
  %t1821 = call i64 @"sx_f64_add"(i64 %t1813, i64 %t1820)
  ret i64 %t1821
}

define i64 @"loss_c4"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t1822 = load i64, ptr %local.w0
  %t1823 = call i64 @f64_parse(ptr @.str.exp_s_controller.343)
  %t1824 = call i64 @"sx_f64_sub"(i64 %t1822, i64 %t1823)
  %t1825 = load i64, ptr %local.w0
  %t1826 = call i64 @f64_parse(ptr @.str.exp_s_controller.344)
  %t1827 = call i64 @"sx_f64_sub"(i64 %t1825, i64 %t1826)
  %t1828 = call i64 @"sx_f64_mul"(i64 %t1824, i64 %t1827)
  %t1829 = load i64, ptr %local.w1
  %t1830 = call i64 @f64_parse(ptr @.str.exp_s_controller.345)
  %t1831 = call i64 @"sx_f64_add"(i64 %t1829, i64 %t1830)
  %t1832 = load i64, ptr %local.w1
  %t1833 = call i64 @f64_parse(ptr @.str.exp_s_controller.346)
  %t1834 = call i64 @"sx_f64_add"(i64 %t1832, i64 %t1833)
  %t1835 = call i64 @"sx_f64_mul"(i64 %t1831, i64 %t1834)
  %t1836 = call i64 @"sx_f64_add"(i64 %t1828, i64 %t1835)
  %t1837 = load i64, ptr %local.w2
  %t1838 = call i64 @f64_parse(ptr @.str.exp_s_controller.347)
  %t1839 = call i64 @"sx_f64_sub"(i64 %t1837, i64 %t1838)
  %t1840 = load i64, ptr %local.w2
  %t1841 = call i64 @f64_parse(ptr @.str.exp_s_controller.348)
  %t1842 = call i64 @"sx_f64_sub"(i64 %t1840, i64 %t1841)
  %t1843 = call i64 @"sx_f64_mul"(i64 %t1839, i64 %t1842)
  %t1844 = call i64 @"sx_f64_add"(i64 %t1836, i64 %t1843)
  %t1845 = load i64, ptr %local.w3
  %t1846 = load i64, ptr %local.w3
  %t1847 = call i64 @"sx_f64_mul"(i64 %t1845, i64 %t1846)
  %t1848 = call i64 @"sx_f64_add"(i64 %t1844, i64 %t1847)
  ret i64 %t1848
}

define i64 @"combined4"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t1849 = load i64, ptr %local.w0
  %t1850 = load i64, ptr %local.w1
  %t1851 = load i64, ptr %local.w2
  %t1852 = load i64, ptr %local.w3
  %t1853 = call i64 @"loss_a4"(i64 %t1849, i64 %t1850, i64 %t1851, i64 %t1852)
  %t1854 = load i64, ptr %local.w0
  %t1855 = load i64, ptr %local.w1
  %t1856 = load i64, ptr %local.w2
  %t1857 = load i64, ptr %local.w3
  %t1858 = call i64 @"loss_b4"(i64 %t1854, i64 %t1855, i64 %t1856, i64 %t1857)
  %t1859 = call i64 @"sx_f64_add"(i64 %t1853, i64 %t1858)
  %t1860 = load i64, ptr %local.w0
  %t1861 = load i64, ptr %local.w1
  %t1862 = load i64, ptr %local.w2
  %t1863 = load i64, ptr %local.w3
  %t1864 = call i64 @"loss_c4"(i64 %t1860, i64 %t1861, i64 %t1862, i64 %t1863)
  %t1865 = call i64 @"sx_f64_add"(i64 %t1859, i64 %t1864)
  ret i64 %t1865
}

define i64 @"run_inner"(i64 %alpha, i64 %steps) nounwind {
entry:
  %local.w0.1866 = alloca i64
  %local.w1.1867 = alloca i64
  %local.w2.1868 = alloca i64
  %local.w3.1869 = alloca i64
  %local.step.1870 = alloca i64
  %local.lr.1871 = alloca i64
  %local.ga0.1872 = alloca i64
  %local.ga1.1873 = alloca i64
  %local.ga2.1874 = alloca i64
  %local.ga3.1875 = alloca i64
  %local.gb0.1876 = alloca i64
  %local.gb1.1877 = alloca i64
  %local.gb2.1878 = alloca i64
  %local.gb3.1879 = alloca i64
  %local.gc0.1880 = alloca i64
  %local.gc1.1881 = alloca i64
  %local.gc2.1882 = alloca i64
  %local.gc3.1883 = alloca i64
  %local.g0.1884 = alloca i64
  %local.g1.1885 = alloca i64
  %local.g2.1886 = alloca i64
  %local.g3.1887 = alloca i64
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t1888 = call i64 @f64_parse(ptr @.str.exp_s_controller.349)
  store i64 %t1888, ptr %local.w0.1866
  %t1889 = call i64 @f64_parse(ptr @.str.exp_s_controller.350)
  store i64 %t1889, ptr %local.w1.1867
  %t1890 = call i64 @f64_parse(ptr @.str.exp_s_controller.351)
  store i64 %t1890, ptr %local.w2.1868
  %t1891 = call i64 @f64_parse(ptr @.str.exp_s_controller.352)
  store i64 %t1891, ptr %local.w3.1869
  store i64 0, ptr %local.step.1870
  %t1892 = call i64 @f64_parse(ptr @.str.exp_s_controller.353)
  store i64 %t1892, ptr %local.lr.1871
  %t1893 = call i64 @f64_parse(ptr @.str.exp_s_controller.354)
  store i64 %t1893, ptr %local.ga0.1872
  %t1894 = call i64 @f64_parse(ptr @.str.exp_s_controller.355)
  store i64 %t1894, ptr %local.ga1.1873
  %t1895 = call i64 @f64_parse(ptr @.str.exp_s_controller.356)
  store i64 %t1895, ptr %local.ga2.1874
  %t1896 = call i64 @f64_parse(ptr @.str.exp_s_controller.357)
  store i64 %t1896, ptr %local.ga3.1875
  %t1897 = call i64 @f64_parse(ptr @.str.exp_s_controller.358)
  store i64 %t1897, ptr %local.gb0.1876
  %t1898 = call i64 @f64_parse(ptr @.str.exp_s_controller.359)
  store i64 %t1898, ptr %local.gb1.1877
  %t1899 = call i64 @f64_parse(ptr @.str.exp_s_controller.360)
  store i64 %t1899, ptr %local.gb2.1878
  %t1900 = call i64 @f64_parse(ptr @.str.exp_s_controller.361)
  store i64 %t1900, ptr %local.gb3.1879
  %t1901 = call i64 @f64_parse(ptr @.str.exp_s_controller.362)
  store i64 %t1901, ptr %local.gc0.1880
  %t1902 = call i64 @f64_parse(ptr @.str.exp_s_controller.363)
  store i64 %t1902, ptr %local.gc1.1881
  %t1903 = call i64 @f64_parse(ptr @.str.exp_s_controller.364)
  store i64 %t1903, ptr %local.gc2.1882
  %t1904 = call i64 @f64_parse(ptr @.str.exp_s_controller.365)
  store i64 %t1904, ptr %local.gc3.1883
  br label %loop53
loop53:
  %t1905 = load i64, ptr %local.step.1870
  %t1906 = load i64, ptr %local.steps
  %t1907 = icmp slt i64 %t1905, %t1906
  %t1908 = zext i1 %t1907 to i64
  %t1909 = icmp ne i64 %t1908, 0
  br i1 %t1909, label %body53, label %endloop53
body53:
  %t1910 = call i64 @f64_parse(ptr @.str.exp_s_controller.366)
  %t1911 = load i64, ptr %local.w0.1866
  %t1912 = call i64 @f64_parse(ptr @.str.exp_s_controller.367)
  %t1913 = call i64 @"sx_f64_sub"(i64 %t1911, i64 %t1912)
  %t1914 = call i64 @"sx_f64_mul"(i64 %t1910, i64 %t1913)
  store i64 %t1914, ptr %local.ga0.1872
  %t1915 = call i64 @f64_parse(ptr @.str.exp_s_controller.368)
  %t1916 = load i64, ptr %local.w1.1867
  %t1917 = call i64 @f64_parse(ptr @.str.exp_s_controller.369)
  %t1918 = call i64 @"sx_f64_sub"(i64 %t1916, i64 %t1917)
  %t1919 = call i64 @"sx_f64_mul"(i64 %t1915, i64 %t1918)
  store i64 %t1919, ptr %local.ga1.1873
  %t1920 = call i64 @f64_parse(ptr @.str.exp_s_controller.370)
  %t1921 = load i64, ptr %local.w2.1868
  %t1922 = call i64 @f64_parse(ptr @.str.exp_s_controller.371)
  %t1923 = call i64 @"sx_f64_sub"(i64 %t1921, i64 %t1922)
  %t1924 = call i64 @"sx_f64_mul"(i64 %t1920, i64 %t1923)
  store i64 %t1924, ptr %local.ga2.1874
  %t1925 = call i64 @f64_parse(ptr @.str.exp_s_controller.372)
  %t1926 = load i64, ptr %local.w3.1869
  %t1927 = call i64 @f64_parse(ptr @.str.exp_s_controller.373)
  %t1928 = call i64 @"sx_f64_add"(i64 %t1926, i64 %t1927)
  %t1929 = call i64 @"sx_f64_mul"(i64 %t1925, i64 %t1928)
  store i64 %t1929, ptr %local.ga3.1875
  %t1930 = call i64 @f64_parse(ptr @.str.exp_s_controller.374)
  %t1931 = load i64, ptr %local.w0.1866
  %t1932 = call i64 @f64_parse(ptr @.str.exp_s_controller.375)
  %t1933 = call i64 @"sx_f64_add"(i64 %t1931, i64 %t1932)
  %t1934 = call i64 @"sx_f64_mul"(i64 %t1930, i64 %t1933)
  store i64 %t1934, ptr %local.gb0.1876
  %t1935 = call i64 @f64_parse(ptr @.str.exp_s_controller.376)
  %t1936 = load i64, ptr %local.w1.1867
  %t1937 = call i64 @f64_parse(ptr @.str.exp_s_controller.377)
  %t1938 = call i64 @"sx_f64_sub"(i64 %t1936, i64 %t1937)
  %t1939 = call i64 @"sx_f64_mul"(i64 %t1935, i64 %t1938)
  store i64 %t1939, ptr %local.gb1.1877
  %t1940 = call i64 @f64_parse(ptr @.str.exp_s_controller.378)
  %t1941 = load i64, ptr %local.w2.1868
  %t1942 = call i64 @f64_parse(ptr @.str.exp_s_controller.379)
  %t1943 = call i64 @"sx_f64_add"(i64 %t1941, i64 %t1942)
  %t1944 = call i64 @"sx_f64_mul"(i64 %t1940, i64 %t1943)
  store i64 %t1944, ptr %local.gb2.1878
  %t1945 = call i64 @f64_parse(ptr @.str.exp_s_controller.380)
  %t1946 = load i64, ptr %local.w3.1869
  %t1947 = call i64 @f64_parse(ptr @.str.exp_s_controller.381)
  %t1948 = call i64 @"sx_f64_sub"(i64 %t1946, i64 %t1947)
  %t1949 = call i64 @"sx_f64_mul"(i64 %t1945, i64 %t1948)
  store i64 %t1949, ptr %local.gb3.1879
  %t1950 = call i64 @f64_parse(ptr @.str.exp_s_controller.382)
  %t1951 = load i64, ptr %local.w0.1866
  %t1952 = call i64 @f64_parse(ptr @.str.exp_s_controller.383)
  %t1953 = call i64 @"sx_f64_sub"(i64 %t1951, i64 %t1952)
  %t1954 = call i64 @"sx_f64_mul"(i64 %t1950, i64 %t1953)
  store i64 %t1954, ptr %local.gc0.1880
  %t1955 = call i64 @f64_parse(ptr @.str.exp_s_controller.384)
  %t1956 = load i64, ptr %local.w1.1867
  %t1957 = call i64 @f64_parse(ptr @.str.exp_s_controller.385)
  %t1958 = call i64 @"sx_f64_add"(i64 %t1956, i64 %t1957)
  %t1959 = call i64 @"sx_f64_mul"(i64 %t1955, i64 %t1958)
  store i64 %t1959, ptr %local.gc1.1881
  %t1960 = call i64 @f64_parse(ptr @.str.exp_s_controller.386)
  %t1961 = load i64, ptr %local.w2.1868
  %t1962 = call i64 @f64_parse(ptr @.str.exp_s_controller.387)
  %t1963 = call i64 @"sx_f64_sub"(i64 %t1961, i64 %t1962)
  %t1964 = call i64 @"sx_f64_mul"(i64 %t1960, i64 %t1963)
  store i64 %t1964, ptr %local.gc2.1882
  %t1965 = call i64 @f64_parse(ptr @.str.exp_s_controller.388)
  %t1966 = load i64, ptr %local.w3.1869
  %t1967 = call i64 @"sx_f64_mul"(i64 %t1965, i64 %t1966)
  store i64 %t1967, ptr %local.gc3.1883
  %t1968 = load i64, ptr %local.ga0.1872
  %t1969 = load i64, ptr %local.gb0.1876
  %t1970 = call i64 @"sx_f64_add"(i64 %t1968, i64 %t1969)
  %t1971 = load i64, ptr %local.gc0.1880
  %t1972 = call i64 @"sx_f64_add"(i64 %t1970, i64 %t1971)
  store i64 %t1972, ptr %local.g0.1884
  %t1973 = load i64, ptr %local.ga1.1873
  %t1974 = load i64, ptr %local.gb1.1877
  %t1975 = call i64 @"sx_f64_add"(i64 %t1973, i64 %t1974)
  %t1976 = load i64, ptr %local.gc1.1881
  %t1977 = call i64 @"sx_f64_add"(i64 %t1975, i64 %t1976)
  store i64 %t1977, ptr %local.g1.1885
  %t1978 = load i64, ptr %local.ga2.1874
  %t1979 = load i64, ptr %local.gb2.1878
  %t1980 = call i64 @"sx_f64_add"(i64 %t1978, i64 %t1979)
  %t1981 = load i64, ptr %local.gc2.1882
  %t1982 = call i64 @"sx_f64_add"(i64 %t1980, i64 %t1981)
  store i64 %t1982, ptr %local.g2.1886
  %t1983 = load i64, ptr %local.ga3.1875
  %t1984 = load i64, ptr %local.gb3.1879
  %t1985 = call i64 @"sx_f64_add"(i64 %t1983, i64 %t1984)
  %t1986 = load i64, ptr %local.gc3.1883
  %t1987 = call i64 @"sx_f64_add"(i64 %t1985, i64 %t1986)
  store i64 %t1987, ptr %local.g3.1887
  %t1988 = load i64, ptr %local.ga0.1872
  %t1989 = load i64, ptr %local.gb0.1876
  %t1990 = call i64 @"sx_f64_mul"(i64 %t1988, i64 %t1989)
  %t1991 = call i64 @f64_parse(ptr @.str.exp_s_controller.389)
  %t1992 = call i64 @"sx_f64_lt"(i64 %t1990, i64 %t1991)
  %t1993 = icmp ne i64 %t1992, 0
  br i1 %t1993, label %then54, label %else54
then54:
  %t1994 = load i64, ptr %local.g0.1884
  %t1995 = load i64, ptr %local.alpha
  %t1996 = call i64 @"sx_f64_mul"(i64 %t1994, i64 %t1995)
  store i64 %t1996, ptr %local.g0.1884
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t1997 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t1998 = load i64, ptr %local.ga1.1873
  %t1999 = load i64, ptr %local.gb1.1877
  %t2000 = call i64 @"sx_f64_mul"(i64 %t1998, i64 %t1999)
  %t2001 = call i64 @f64_parse(ptr @.str.exp_s_controller.390)
  %t2002 = call i64 @"sx_f64_lt"(i64 %t2000, i64 %t2001)
  %t2003 = icmp ne i64 %t2002, 0
  br i1 %t2003, label %then55, label %else55
then55:
  %t2004 = load i64, ptr %local.g1.1885
  %t2005 = load i64, ptr %local.alpha
  %t2006 = call i64 @"sx_f64_mul"(i64 %t2004, i64 %t2005)
  store i64 %t2006, ptr %local.g1.1885
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t2007 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t2008 = load i64, ptr %local.ga2.1874
  %t2009 = load i64, ptr %local.gb2.1878
  %t2010 = call i64 @"sx_f64_mul"(i64 %t2008, i64 %t2009)
  %t2011 = call i64 @f64_parse(ptr @.str.exp_s_controller.391)
  %t2012 = call i64 @"sx_f64_lt"(i64 %t2010, i64 %t2011)
  %t2013 = icmp ne i64 %t2012, 0
  br i1 %t2013, label %then56, label %else56
then56:
  %t2014 = load i64, ptr %local.g2.1886
  %t2015 = load i64, ptr %local.alpha
  %t2016 = call i64 @"sx_f64_mul"(i64 %t2014, i64 %t2015)
  store i64 %t2016, ptr %local.g2.1886
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t2017 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t2018 = load i64, ptr %local.ga3.1875
  %t2019 = load i64, ptr %local.gb3.1879
  %t2020 = call i64 @"sx_f64_mul"(i64 %t2018, i64 %t2019)
  %t2021 = call i64 @f64_parse(ptr @.str.exp_s_controller.392)
  %t2022 = call i64 @"sx_f64_lt"(i64 %t2020, i64 %t2021)
  %t2023 = icmp ne i64 %t2022, 0
  br i1 %t2023, label %then57, label %else57
then57:
  %t2024 = load i64, ptr %local.g3.1887
  %t2025 = load i64, ptr %local.alpha
  %t2026 = call i64 @"sx_f64_mul"(i64 %t2024, i64 %t2025)
  store i64 %t2026, ptr %local.g3.1887
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t2027 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t2028 = load i64, ptr %local.w0.1866
  %t2029 = load i64, ptr %local.lr.1871
  %t2030 = load i64, ptr %local.g0.1884
  %t2031 = call i64 @"sx_f64_mul"(i64 %t2029, i64 %t2030)
  %t2032 = call i64 @"sx_f64_sub"(i64 %t2028, i64 %t2031)
  store i64 %t2032, ptr %local.w0.1866
  %t2033 = load i64, ptr %local.w1.1867
  %t2034 = load i64, ptr %local.lr.1871
  %t2035 = load i64, ptr %local.g1.1885
  %t2036 = call i64 @"sx_f64_mul"(i64 %t2034, i64 %t2035)
  %t2037 = call i64 @"sx_f64_sub"(i64 %t2033, i64 %t2036)
  store i64 %t2037, ptr %local.w1.1867
  %t2038 = load i64, ptr %local.w2.1868
  %t2039 = load i64, ptr %local.lr.1871
  %t2040 = load i64, ptr %local.g2.1886
  %t2041 = call i64 @"sx_f64_mul"(i64 %t2039, i64 %t2040)
  %t2042 = call i64 @"sx_f64_sub"(i64 %t2038, i64 %t2041)
  store i64 %t2042, ptr %local.w2.1868
  %t2043 = load i64, ptr %local.w3.1869
  %t2044 = load i64, ptr %local.lr.1871
  %t2045 = load i64, ptr %local.g3.1887
  %t2046 = call i64 @"sx_f64_mul"(i64 %t2044, i64 %t2045)
  %t2047 = call i64 @"sx_f64_sub"(i64 %t2043, i64 %t2046)
  store i64 %t2047, ptr %local.w3.1869
  %t2048 = load i64, ptr %local.step.1870
  %t2049 = add i64 %t2048, 1
  store i64 %t2049, ptr %local.step.1870
  br label %loop53
endloop53:
  %t2050 = load i64, ptr %local.w0.1866
  %t2051 = load i64, ptr %local.w1.1867
  %t2052 = load i64, ptr %local.w2.1868
  %t2053 = load i64, ptr %local.w3.1869
  %t2054 = call i64 @"combined4"(i64 %t2050, i64 %t2051, i64 %t2052, i64 %t2053)
  ret i64 %t2054
}

define i64 @"meta_grad_alpha4"(i64 %alpha, i64 %steps) nounwind {
entry:
  %local.h.2055 = alloca i64
  %local.lp.2056 = alloca i64
  %local.lm.2057 = alloca i64
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t2058 = call i64 @f64_parse(ptr @.str.exp_s_controller.393)
  store i64 %t2058, ptr %local.h.2055
  %t2059 = load i64, ptr %local.alpha
  %t2060 = load i64, ptr %local.h.2055
  %t2061 = call i64 @"sx_f64_add"(i64 %t2059, i64 %t2060)
  %t2062 = load i64, ptr %local.steps
  %t2063 = call i64 @"run_inner"(i64 %t2061, i64 %t2062)
  store i64 %t2063, ptr %local.lp.2056
  %t2064 = load i64, ptr %local.alpha
  %t2065 = load i64, ptr %local.h.2055
  %t2066 = call i64 @"sx_f64_sub"(i64 %t2064, i64 %t2065)
  %t2067 = load i64, ptr %local.steps
  %t2068 = call i64 @"run_inner"(i64 %t2066, i64 %t2067)
  store i64 %t2068, ptr %local.lm.2057
  %t2069 = load i64, ptr %local.lp.2056
  %t2070 = load i64, ptr %local.lm.2057
  %t2071 = call i64 @"sx_f64_sub"(i64 %t2069, i64 %t2070)
  %t2072 = call i64 @f64_parse(ptr @.str.exp_s_controller.394)
  %t2073 = load i64, ptr %local.h.2055
  %t2074 = call i64 @"sx_f64_mul"(i64 %t2072, i64 %t2073)
  %t2075 = call i64 @"sx_f64_div"(i64 %t2071, i64 %t2074)
  ret i64 %t2075
}

define i64 @"train_meta_fixed"(i64 %meta_lr, i64 %meta_cycles, i64 %inner_steps) nounwind {
entry:
  %local.alpha.2076 = alloca i64
  %local.cycle.2077 = alloca i64
  %local.mg.2078 = alloca i64
  %local.meta_lr = alloca i64
  store i64 %meta_lr, ptr %local.meta_lr
  %local.meta_cycles = alloca i64
  store i64 %meta_cycles, ptr %local.meta_cycles
  %local.inner_steps = alloca i64
  store i64 %inner_steps, ptr %local.inner_steps
  %t2079 = call i64 @f64_parse(ptr @.str.exp_s_controller.395)
  store i64 %t2079, ptr %local.alpha.2076
  store i64 0, ptr %local.cycle.2077
  %t2080 = call i64 @f64_parse(ptr @.str.exp_s_controller.396)
  store i64 %t2080, ptr %local.mg.2078
  br label %loop58
loop58:
  %t2081 = load i64, ptr %local.cycle.2077
  %t2082 = load i64, ptr %local.meta_cycles
  %t2083 = icmp slt i64 %t2081, %t2082
  %t2084 = zext i1 %t2083 to i64
  %t2085 = icmp ne i64 %t2084, 0
  br i1 %t2085, label %body58, label %endloop58
body58:
  %t2086 = load i64, ptr %local.alpha.2076
  %t2087 = load i64, ptr %local.inner_steps
  %t2088 = call i64 @"meta_grad_alpha4"(i64 %t2086, i64 %t2087)
  store i64 %t2088, ptr %local.mg.2078
  %t2089 = load i64, ptr %local.alpha.2076
  %t2090 = load i64, ptr %local.meta_lr
  %t2091 = load i64, ptr %local.mg.2078
  %t2092 = call i64 @"sx_f64_mul"(i64 %t2090, i64 %t2091)
  %t2093 = call i64 @"sx_f64_sub"(i64 %t2089, i64 %t2092)
  %t2094 = call i64 @f64_parse(ptr @.str.exp_s_controller.397)
  %t2095 = call i64 @f64_parse(ptr @.str.exp_s_controller.398)
  %t2096 = call i64 @"clamp"(i64 %t2093, i64 %t2094, i64 %t2095)
  store i64 %t2096, ptr %local.alpha.2076
  %t2097 = load i64, ptr %local.cycle.2077
  %t2098 = add i64 %t2097, 1
  store i64 %t2098, ptr %local.cycle.2077
  br label %loop58
endloop58:
  %t2099 = load i64, ptr %local.alpha.2076
  %t2100 = load i64, ptr %local.inner_steps
  %t2101 = call i64 @"run_inner"(i64 %t2099, i64 %t2100)
  ret i64 %t2101
}

define i64 @"train_meta_s_ctrl"(i64 %base_meta_lr, i64 %meta_cycles, i64 %inner_steps, i64 %verbose) nounwind {
entry:
  %local.alpha.2102 = alloca i64
  %local.cycle.2103 = alloca i64
  %local.mg.2104 = alloca i64
  %local.prev_loss.2105 = alloca i64
  %local.curr_loss.2106 = alloca i64
  %local.prev_drift.2107 = alloca i64
  %local.s_val.2108 = alloca i64
  %local.meta_lr.2109 = alloca i64
  %local.drift.2110 = alloca i64
  %local.base_meta_lr = alloca i64
  store i64 %base_meta_lr, ptr %local.base_meta_lr
  %local.meta_cycles = alloca i64
  store i64 %meta_cycles, ptr %local.meta_cycles
  %local.inner_steps = alloca i64
  store i64 %inner_steps, ptr %local.inner_steps
  %local.verbose = alloca i64
  store i64 %verbose, ptr %local.verbose
  %t2111 = call i64 @f64_parse(ptr @.str.exp_s_controller.399)
  store i64 %t2111, ptr %local.alpha.2102
  store i64 0, ptr %local.cycle.2103
  %t2112 = call i64 @f64_parse(ptr @.str.exp_s_controller.400)
  store i64 %t2112, ptr %local.mg.2104
  %t2113 = call i64 @f64_parse(ptr @.str.exp_s_controller.401)
  %t2114 = load i64, ptr %local.inner_steps
  %t2115 = call i64 @"run_inner"(i64 %t2113, i64 %t2114)
  store i64 %t2115, ptr %local.prev_loss.2105
  %t2116 = load i64, ptr %local.prev_loss.2105
  store i64 %t2116, ptr %local.curr_loss.2106
  %t2117 = call i64 @f64_parse(ptr @.str.exp_s_controller.402)
  store i64 %t2117, ptr %local.prev_drift.2107
  %t2118 = call i64 @f64_parse(ptr @.str.exp_s_controller.403)
  store i64 %t2118, ptr %local.s_val.2108
  %t2119 = load i64, ptr %local.base_meta_lr
  store i64 %t2119, ptr %local.meta_lr.2109
  br label %loop59
loop59:
  %t2120 = load i64, ptr %local.cycle.2103
  %t2121 = load i64, ptr %local.meta_cycles
  %t2122 = icmp slt i64 %t2120, %t2121
  %t2123 = zext i1 %t2122 to i64
  %t2124 = icmp ne i64 %t2123, 0
  br i1 %t2124, label %body59, label %endloop59
body59:
  %t2125 = load i64, ptr %local.alpha.2102
  %t2126 = load i64, ptr %local.inner_steps
  %t2127 = call i64 @"run_inner"(i64 %t2125, i64 %t2126)
  store i64 %t2127, ptr %local.curr_loss.2106
  %t2128 = load i64, ptr %local.curr_loss.2106
  %t2129 = load i64, ptr %local.prev_loss.2105
  %t2130 = call i64 @"sx_f64_sub"(i64 %t2128, i64 %t2129)
  %t2131 = call i64 @"abs_f64"(i64 %t2130)
  store i64 %t2131, ptr %local.drift.2110
  %t2132 = load i64, ptr %local.cycle.2103
  %t2133 = icmp sgt i64 %t2132, 0
  %t2134 = zext i1 %t2133 to i64
  %t2135 = icmp ne i64 %t2134, 0
  br i1 %t2135, label %then60, label %else60
then60:
  %t2136 = load i64, ptr %local.prev_drift.2107
  %t2137 = call i64 @f64_parse(ptr @.str.exp_s_controller.404)
  %t2138 = call i64 @"sx_f64_gt"(i64 %t2136, i64 %t2137)
  %t2139 = icmp ne i64 %t2138, 0
  br i1 %t2139, label %then61, label %else61
then61:
  %t2140 = call i64 @f64_parse(ptr @.str.exp_s_controller.405)
  %t2141 = load i64, ptr %local.drift.2110
  %t2142 = load i64, ptr %local.prev_drift.2107
  %t2143 = call i64 @"sx_f64_div"(i64 %t2141, i64 %t2142)
  %t2144 = call i64 @"sx_f64_sub"(i64 %t2140, i64 %t2143)
  store i64 %t2144, ptr %local.s_val.2108
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t2145 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t2146 = load i64, ptr %local.base_meta_lr
  %t2147 = call i64 @f64_parse(ptr @.str.exp_s_controller.406)
  %t2148 = call i64 @f64_parse(ptr @.str.exp_s_controller.407)
  %t2149 = load i64, ptr %local.s_val.2108
  %t2150 = call i64 @"sx_f64_add"(i64 %t2148, i64 %t2149)
  %t2151 = call i64 @"sx_f64_sub"(i64 %t2147, i64 %t2150)
  %t2152 = call i64 @f64_parse(ptr @.str.exp_s_controller.408)
  %t2153 = call i64 @f64_parse(ptr @.str.exp_s_controller.409)
  %t2154 = call i64 @"clamp"(i64 %t2151, i64 %t2152, i64 %t2153)
  %t2155 = call i64 @"sx_f64_mul"(i64 %t2146, i64 %t2154)
  store i64 %t2155, ptr %local.meta_lr.2109
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t2156 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t2157 = load i64, ptr %local.alpha.2102
  %t2158 = load i64, ptr %local.inner_steps
  %t2159 = call i64 @"meta_grad_alpha4"(i64 %t2157, i64 %t2158)
  store i64 %t2159, ptr %local.mg.2104
  %t2160 = load i64, ptr %local.alpha.2102
  %t2161 = load i64, ptr %local.meta_lr.2109
  %t2162 = load i64, ptr %local.mg.2104
  %t2163 = call i64 @"sx_f64_mul"(i64 %t2161, i64 %t2162)
  %t2164 = call i64 @"sx_f64_sub"(i64 %t2160, i64 %t2163)
  %t2165 = call i64 @f64_parse(ptr @.str.exp_s_controller.410)
  %t2166 = call i64 @f64_parse(ptr @.str.exp_s_controller.411)
  %t2167 = call i64 @"clamp"(i64 %t2164, i64 %t2165, i64 %t2166)
  store i64 %t2167, ptr %local.alpha.2102
  %t2168 = load i64, ptr %local.verbose
  %t2169 = icmp eq i64 %t2168, 1
  %t2170 = zext i1 %t2169 to i64
  %t2171 = icmp ne i64 %t2170, 0
  br i1 %t2171, label %then62, label %else62
then62:
  %t2172 = load i64, ptr %local.cycle.2103
  %t2173 = icmp slt i64 %t2172, 3
  %t2174 = zext i1 %t2173 to i64
  %t2175 = icmp ne i64 %t2174, 0
  br i1 %t2175, label %then63, label %else63
then63:
  %t2176 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.412)
  %t2177 = ptrtoint ptr %t2176 to i64
  %t2178 = inttoptr i64 %t2177 to ptr
  call void @intrinsic_print(ptr %t2178)
  %t2179 = load i64, ptr %local.cycle.2103
  call void @print_i64(i64 %t2179)
  %t2180 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.413)
  %t2181 = ptrtoint ptr %t2180 to i64
  %t2182 = inttoptr i64 %t2181 to ptr
  call void @intrinsic_print(ptr %t2182)
  %t2183 = load i64, ptr %local.s_val.2108
  %t2184 = call i64 @"print_f64"(i64 %t2183)
  %t2185 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.414)
  %t2186 = ptrtoint ptr %t2185 to i64
  %t2187 = inttoptr i64 %t2186 to ptr
  call void @intrinsic_print(ptr %t2187)
  %t2188 = load i64, ptr %local.meta_lr.2109
  %t2189 = call i64 @"print_f64"(i64 %t2188)
  %t2190 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.415)
  %t2191 = ptrtoint ptr %t2190 to i64
  %t2192 = inttoptr i64 %t2191 to ptr
  call void @intrinsic_print(ptr %t2192)
  %t2193 = load i64, ptr %local.alpha.2102
  %t2194 = call i64 @"print_f64"(i64 %t2193)
  %t2195 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.416)
  %t2196 = ptrtoint ptr %t2195 to i64
  %t2197 = inttoptr i64 %t2196 to ptr
  call void @intrinsic_print(ptr %t2197)
  %t2198 = load i64, ptr %local.curr_loss.2106
  %t2199 = call i64 @"print_f64"(i64 %t2198)
  %t2200 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.417)
  %t2201 = ptrtoint ptr %t2200 to i64
  %t2202 = inttoptr i64 %t2201 to ptr
  call void @intrinsic_println(ptr %t2202)
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t2203 = phi i64 [ 0, %then63_end ], [ 0, %else63_end ]
  %t2204 = load i64, ptr %local.cycle.2103
  %t2205 = icmp eq i64 %t2204, 14
  %t2206 = zext i1 %t2205 to i64
  %t2207 = icmp ne i64 %t2206, 0
  br i1 %t2207, label %then64, label %else64
then64:
  %t2208 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.418)
  %t2209 = ptrtoint ptr %t2208 to i64
  %t2210 = inttoptr i64 %t2209 to ptr
  call void @intrinsic_print(ptr %t2210)
  %t2211 = load i64, ptr %local.s_val.2108
  %t2212 = call i64 @"print_f64"(i64 %t2211)
  %t2213 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.419)
  %t2214 = ptrtoint ptr %t2213 to i64
  %t2215 = inttoptr i64 %t2214 to ptr
  call void @intrinsic_print(ptr %t2215)
  %t2216 = load i64, ptr %local.meta_lr.2109
  %t2217 = call i64 @"print_f64"(i64 %t2216)
  %t2218 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.420)
  %t2219 = ptrtoint ptr %t2218 to i64
  %t2220 = inttoptr i64 %t2219 to ptr
  call void @intrinsic_print(ptr %t2220)
  %t2221 = load i64, ptr %local.alpha.2102
  %t2222 = call i64 @"print_f64"(i64 %t2221)
  %t2223 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.421)
  %t2224 = ptrtoint ptr %t2223 to i64
  %t2225 = inttoptr i64 %t2224 to ptr
  call void @intrinsic_print(ptr %t2225)
  %t2226 = load i64, ptr %local.curr_loss.2106
  %t2227 = call i64 @"print_f64"(i64 %t2226)
  %t2228 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.422)
  %t2229 = ptrtoint ptr %t2228 to i64
  %t2230 = inttoptr i64 %t2229 to ptr
  call void @intrinsic_println(ptr %t2230)
  br label %then64_end
then64_end:
  br label %endif64
else64:
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t2231 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  %t2232 = load i64, ptr %local.cycle.2103
  %t2233 = icmp eq i64 %t2232, 29
  %t2234 = zext i1 %t2233 to i64
  %t2235 = icmp ne i64 %t2234, 0
  br i1 %t2235, label %then65, label %else65
then65:
  %t2236 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.423)
  %t2237 = ptrtoint ptr %t2236 to i64
  %t2238 = inttoptr i64 %t2237 to ptr
  call void @intrinsic_print(ptr %t2238)
  %t2239 = load i64, ptr %local.s_val.2108
  %t2240 = call i64 @"print_f64"(i64 %t2239)
  %t2241 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.424)
  %t2242 = ptrtoint ptr %t2241 to i64
  %t2243 = inttoptr i64 %t2242 to ptr
  call void @intrinsic_print(ptr %t2243)
  %t2244 = load i64, ptr %local.meta_lr.2109
  %t2245 = call i64 @"print_f64"(i64 %t2244)
  %t2246 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.425)
  %t2247 = ptrtoint ptr %t2246 to i64
  %t2248 = inttoptr i64 %t2247 to ptr
  call void @intrinsic_print(ptr %t2248)
  %t2249 = load i64, ptr %local.alpha.2102
  %t2250 = call i64 @"print_f64"(i64 %t2249)
  %t2251 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.426)
  %t2252 = ptrtoint ptr %t2251 to i64
  %t2253 = inttoptr i64 %t2252 to ptr
  call void @intrinsic_print(ptr %t2253)
  %t2254 = load i64, ptr %local.curr_loss.2106
  %t2255 = call i64 @"print_f64"(i64 %t2254)
  %t2256 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.427)
  %t2257 = ptrtoint ptr %t2256 to i64
  %t2258 = inttoptr i64 %t2257 to ptr
  call void @intrinsic_println(ptr %t2258)
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t2259 = phi i64 [ 0, %then65_end ], [ 0, %else65_end ]
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t2260 = phi i64 [ %t2259, %then62_end ], [ 0, %else62_end ]
  %t2261 = load i64, ptr %local.drift.2110
  store i64 %t2261, ptr %local.prev_drift.2107
  %t2262 = load i64, ptr %local.prev_drift.2107
  %t2263 = call i64 @f64_parse(ptr @.str.exp_s_controller.428)
  %t2264 = call i64 @"sx_f64_lt"(i64 %t2262, i64 %t2263)
  %t2265 = icmp ne i64 %t2264, 0
  br i1 %t2265, label %then66, label %else66
then66:
  %t2266 = call i64 @f64_parse(ptr @.str.exp_s_controller.429)
  store i64 %t2266, ptr %local.prev_drift.2107
  br label %then66_end
then66_end:
  br label %endif66
else66:
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t2267 = phi i64 [ 0, %then66_end ], [ 0, %else66_end ]
  %t2268 = load i64, ptr %local.curr_loss.2106
  store i64 %t2268, ptr %local.prev_loss.2105
  %t2269 = load i64, ptr %local.cycle.2103
  %t2270 = add i64 %t2269, 1
  store i64 %t2270, ptr %local.cycle.2103
  br label %loop59
endloop59:
  %t2271 = load i64, ptr %local.alpha.2102
  %t2272 = load i64, ptr %local.inner_steps
  %t2273 = call i64 @"run_inner"(i64 %t2271, i64 %t2272)
  ret i64 %t2273
}

define i64 @"run_exp4"() nounwind {
entry:
  %local.meta_cycles.2274 = alloca i64
  %local.inner_steps.2275 = alloca i64
  %local.loss_none.2276 = alloca i64
  %local.loss_fixed.2277 = alloca i64
  %local.loss_slow.2278 = alloca i64
  %local.loss_s.2279 = alloca i64
  %local.best_fixed_loss.2280 = alloca i64
  %t2281 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.430)
  %t2282 = ptrtoint ptr %t2281 to i64
  %t2283 = inttoptr i64 %t2282 to ptr
  call void @intrinsic_println(ptr %t2283)
  %t2284 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.431)
  %t2285 = ptrtoint ptr %t2284 to i64
  %t2286 = inttoptr i64 %t2285 to ptr
  call void @intrinsic_println(ptr %t2286)
  %t2287 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.432)
  %t2288 = ptrtoint ptr %t2287 to i64
  %t2289 = inttoptr i64 %t2288 to ptr
  call void @intrinsic_println(ptr %t2289)
  %t2290 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.433)
  %t2291 = ptrtoint ptr %t2290 to i64
  %t2292 = inttoptr i64 %t2291 to ptr
  call void @intrinsic_println(ptr %t2292)
  %t2293 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.434)
  %t2294 = ptrtoint ptr %t2293 to i64
  %t2295 = inttoptr i64 %t2294 to ptr
  call void @intrinsic_println(ptr %t2295)
  %t2296 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.435)
  %t2297 = ptrtoint ptr %t2296 to i64
  %t2298 = inttoptr i64 %t2297 to ptr
  call void @intrinsic_println(ptr %t2298)
  %t2299 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.436)
  %t2300 = ptrtoint ptr %t2299 to i64
  %t2301 = inttoptr i64 %t2300 to ptr
  call void @intrinsic_println(ptr %t2301)
  store i64 30, ptr %local.meta_cycles.2274
  store i64 200, ptr %local.inner_steps.2275
  %t2302 = call i64 @f64_parse(ptr @.str.exp_s_controller.437)
  %t2303 = load i64, ptr %local.inner_steps.2275
  %t2304 = call i64 @"run_inner"(i64 %t2302, i64 %t2303)
  store i64 %t2304, ptr %local.loss_none.2276
  %t2305 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.438)
  %t2306 = ptrtoint ptr %t2305 to i64
  %t2307 = inttoptr i64 %t2306 to ptr
  call void @intrinsic_print(ptr %t2307)
  %t2308 = load i64, ptr %local.loss_none.2276
  %t2309 = call i64 @"print_f64"(i64 %t2308)
  %t2310 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.439)
  %t2311 = ptrtoint ptr %t2310 to i64
  %t2312 = inttoptr i64 %t2311 to ptr
  call void @intrinsic_println(ptr %t2312)
  %t2313 = call i64 @f64_parse(ptr @.str.exp_s_controller.440)
  %t2314 = load i64, ptr %local.meta_cycles.2274
  %t2315 = load i64, ptr %local.inner_steps.2275
  %t2316 = call i64 @"train_meta_fixed"(i64 %t2313, i64 %t2314, i64 %t2315)
  store i64 %t2316, ptr %local.loss_fixed.2277
  %t2317 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.441)
  %t2318 = ptrtoint ptr %t2317 to i64
  %t2319 = inttoptr i64 %t2318 to ptr
  call void @intrinsic_print(ptr %t2319)
  %t2320 = load i64, ptr %local.loss_fixed.2277
  %t2321 = call i64 @"print_f64"(i64 %t2320)
  %t2322 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.442)
  %t2323 = ptrtoint ptr %t2322 to i64
  %t2324 = inttoptr i64 %t2323 to ptr
  call void @intrinsic_println(ptr %t2324)
  %t2325 = call i64 @f64_parse(ptr @.str.exp_s_controller.443)
  %t2326 = load i64, ptr %local.meta_cycles.2274
  %t2327 = load i64, ptr %local.inner_steps.2275
  %t2328 = call i64 @"train_meta_fixed"(i64 %t2325, i64 %t2326, i64 %t2327)
  store i64 %t2328, ptr %local.loss_slow.2278
  %t2329 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.444)
  %t2330 = ptrtoint ptr %t2329 to i64
  %t2331 = inttoptr i64 %t2330 to ptr
  call void @intrinsic_print(ptr %t2331)
  %t2332 = load i64, ptr %local.loss_slow.2278
  %t2333 = call i64 @"print_f64"(i64 %t2332)
  %t2334 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.445)
  %t2335 = ptrtoint ptr %t2334 to i64
  %t2336 = inttoptr i64 %t2335 to ptr
  call void @intrinsic_println(ptr %t2336)
  %t2337 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.446)
  %t2338 = ptrtoint ptr %t2337 to i64
  %t2339 = inttoptr i64 %t2338 to ptr
  call void @intrinsic_println(ptr %t2339)
  %t2340 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.447)
  %t2341 = ptrtoint ptr %t2340 to i64
  %t2342 = inttoptr i64 %t2341 to ptr
  call void @intrinsic_println(ptr %t2342)
  %t2343 = call i64 @f64_parse(ptr @.str.exp_s_controller.448)
  %t2344 = load i64, ptr %local.meta_cycles.2274
  %t2345 = load i64, ptr %local.inner_steps.2275
  %t2346 = call i64 @"train_meta_s_ctrl"(i64 %t2343, i64 %t2344, i64 %t2345, i64 1)
  store i64 %t2346, ptr %local.loss_s.2279
  %t2347 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.449)
  %t2348 = ptrtoint ptr %t2347 to i64
  %t2349 = inttoptr i64 %t2348 to ptr
  call void @intrinsic_println(ptr %t2349)
  %t2350 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.450)
  %t2351 = ptrtoint ptr %t2350 to i64
  %t2352 = inttoptr i64 %t2351 to ptr
  call void @intrinsic_print(ptr %t2352)
  %t2353 = load i64, ptr %local.loss_s.2279
  %t2354 = call i64 @"print_f64"(i64 %t2353)
  %t2355 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.451)
  %t2356 = ptrtoint ptr %t2355 to i64
  %t2357 = inttoptr i64 %t2356 to ptr
  call void @intrinsic_println(ptr %t2357)
  %t2358 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.452)
  %t2359 = ptrtoint ptr %t2358 to i64
  %t2360 = inttoptr i64 %t2359 to ptr
  call void @intrinsic_println(ptr %t2360)
  %t2361 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.453)
  %t2362 = ptrtoint ptr %t2361 to i64
  %t2363 = inttoptr i64 %t2362 to ptr
  call void @intrinsic_println(ptr %t2363)
  %t2364 = load i64, ptr %local.loss_fixed.2277
  store i64 %t2364, ptr %local.best_fixed_loss.2280
  %t2365 = load i64, ptr %local.loss_slow.2278
  %t2366 = load i64, ptr %local.best_fixed_loss.2280
  %t2367 = call i64 @"sx_f64_lt"(i64 %t2365, i64 %t2366)
  %t2368 = icmp ne i64 %t2367, 0
  br i1 %t2368, label %then67, label %else67
then67:
  %t2369 = load i64, ptr %local.loss_slow.2278
  store i64 %t2369, ptr %local.best_fixed_loss.2280
  br label %then67_end
then67_end:
  br label %endif67
else67:
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t2370 = phi i64 [ 0, %then67_end ], [ 0, %else67_end ]
  %t2371 = load i64, ptr %local.loss_s.2279
  %t2372 = load i64, ptr %local.best_fixed_loss.2280
  %t2373 = call i64 @"sx_f64_lt"(i64 %t2371, i64 %t2372)
  %t2374 = icmp ne i64 %t2373, 0
  br i1 %t2374, label %then68, label %else68
then68:
  %t2375 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.454)
  %t2376 = ptrtoint ptr %t2375 to i64
  %t2377 = inttoptr i64 %t2376 to ptr
  call void @intrinsic_println(ptr %t2377)
  %t2378 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.455)
  %t2379 = ptrtoint ptr %t2378 to i64
  %t2380 = inttoptr i64 %t2379 to ptr
  call void @intrinsic_print(ptr %t2380)
  %t2381 = load i64, ptr %local.best_fixed_loss.2280
  %t2382 = load i64, ptr %local.loss_s.2279
  %t2383 = call i64 @"sx_f64_sub"(i64 %t2381, i64 %t2382)
  %t2384 = call i64 @"print_f64"(i64 %t2383)
  %t2385 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.456)
  %t2386 = ptrtoint ptr %t2385 to i64
  %t2387 = inttoptr i64 %t2386 to ptr
  call void @intrinsic_println(ptr %t2387)
  br label %then68_end
then68_end:
  br label %endif68
else68:
  %t2388 = load i64, ptr %local.loss_s.2279
  %t2389 = load i64, ptr %local.best_fixed_loss.2280
  %t2390 = call i64 @f64_parse(ptr @.str.exp_s_controller.457)
  %t2391 = call i64 @"sx_f64_add"(i64 %t2389, i64 %t2390)
  %t2392 = call i64 @"sx_f64_lt"(i64 %t2388, i64 %t2391)
  %t2393 = icmp ne i64 %t2392, 0
  br i1 %t2393, label %then69, label %else69
then69:
  %t2394 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.458)
  %t2395 = ptrtoint ptr %t2394 to i64
  %t2396 = inttoptr i64 %t2395 to ptr
  call void @intrinsic_println(ptr %t2396)
  br label %then69_end
then69_end:
  br label %endif69
else69:
  %t2397 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.459)
  %t2398 = ptrtoint ptr %t2397 to i64
  %t2399 = inttoptr i64 %t2398 to ptr
  call void @intrinsic_println(ptr %t2399)
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t2400 = phi i64 [ 0, %then69_end ], [ 0, %else69_end ]
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t2401 = phi i64 [ 0, %then68_end ], [ %t2400, %else68_end ]
  %t2402 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.460)
  %t2403 = ptrtoint ptr %t2402 to i64
  %t2404 = inttoptr i64 %t2403 to ptr
  call void @intrinsic_println(ptr %t2404)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t2405 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.461)
  %t2406 = ptrtoint ptr %t2405 to i64
  %t2407 = inttoptr i64 %t2406 to ptr
  call void @intrinsic_println(ptr %t2407)
  %t2408 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.462)
  %t2409 = ptrtoint ptr %t2408 to i64
  %t2410 = inttoptr i64 %t2409 to ptr
  call void @intrinsic_println(ptr %t2410)
  %t2411 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.463)
  %t2412 = ptrtoint ptr %t2411 to i64
  %t2413 = inttoptr i64 %t2412 to ptr
  call void @intrinsic_println(ptr %t2413)
  %t2414 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.464)
  %t2415 = ptrtoint ptr %t2414 to i64
  %t2416 = inttoptr i64 %t2415 to ptr
  call void @intrinsic_println(ptr %t2416)
  %t2417 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.465)
  %t2418 = ptrtoint ptr %t2417 to i64
  %t2419 = inttoptr i64 %t2418 to ptr
  call void @intrinsic_println(ptr %t2419)
  %t2420 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.466)
  %t2421 = ptrtoint ptr %t2420 to i64
  %t2422 = inttoptr i64 %t2421 to ptr
  call void @intrinsic_println(ptr %t2422)
  %t2423 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.467)
  %t2424 = ptrtoint ptr %t2423 to i64
  %t2425 = inttoptr i64 %t2424 to ptr
  call void @intrinsic_println(ptr %t2425)
  %t2426 = call i64 @"run_exp1"()
  %t2427 = call i64 @"run_exp2"()
  %t2428 = call i64 @"run_exp3"()
  %t2429 = call i64 @"run_exp4"()
  %t2430 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.468)
  %t2431 = ptrtoint ptr %t2430 to i64
  %t2432 = inttoptr i64 %t2431 to ptr
  call void @intrinsic_println(ptr %t2432)
  %t2433 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.469)
  %t2434 = ptrtoint ptr %t2433 to i64
  %t2435 = inttoptr i64 %t2434 to ptr
  call void @intrinsic_println(ptr %t2435)
  %t2436 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.470)
  %t2437 = ptrtoint ptr %t2436 to i64
  %t2438 = inttoptr i64 %t2437 to ptr
  call void @intrinsic_println(ptr %t2438)
  %t2439 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.471)
  %t2440 = ptrtoint ptr %t2439 to i64
  %t2441 = inttoptr i64 %t2440 to ptr
  call void @intrinsic_println(ptr %t2441)
  %t2442 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.472)
  %t2443 = ptrtoint ptr %t2442 to i64
  %t2444 = inttoptr i64 %t2443 to ptr
  call void @intrinsic_println(ptr %t2444)
  %t2445 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.473)
  %t2446 = ptrtoint ptr %t2445 to i64
  %t2447 = inttoptr i64 %t2446 to ptr
  call void @intrinsic_println(ptr %t2447)
  %t2448 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.474)
  %t2449 = ptrtoint ptr %t2448 to i64
  %t2450 = inttoptr i64 %t2449 to ptr
  call void @intrinsic_println(ptr %t2450)
  %t2451 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.475)
  %t2452 = ptrtoint ptr %t2451 to i64
  %t2453 = inttoptr i64 %t2452 to ptr
  call void @intrinsic_println(ptr %t2453)
  %t2454 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.476)
  %t2455 = ptrtoint ptr %t2454 to i64
  %t2456 = inttoptr i64 %t2455 to ptr
  call void @intrinsic_println(ptr %t2456)
  %t2457 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.477)
  %t2458 = ptrtoint ptr %t2457 to i64
  %t2459 = inttoptr i64 %t2458 to ptr
  call void @intrinsic_println(ptr %t2459)
  %t2460 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.478)
  %t2461 = ptrtoint ptr %t2460 to i64
  %t2462 = inttoptr i64 %t2461 to ptr
  call void @intrinsic_println(ptr %t2462)
  %t2463 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.479)
  %t2464 = ptrtoint ptr %t2463 to i64
  %t2465 = inttoptr i64 %t2464 to ptr
  call void @intrinsic_println(ptr %t2465)
  %t2466 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.480)
  %t2467 = ptrtoint ptr %t2466 to i64
  %t2468 = inttoptr i64 %t2467 to ptr
  call void @intrinsic_println(ptr %t2468)
  %t2469 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.481)
  %t2470 = ptrtoint ptr %t2469 to i64
  %t2471 = inttoptr i64 %t2470 to ptr
  call void @intrinsic_println(ptr %t2471)
  %t2472 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.482)
  %t2473 = ptrtoint ptr %t2472 to i64
  %t2474 = inttoptr i64 %t2473 to ptr
  call void @intrinsic_println(ptr %t2474)
  %t2475 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.483)
  %t2476 = ptrtoint ptr %t2475 to i64
  %t2477 = inttoptr i64 %t2476 to ptr
  call void @intrinsic_println(ptr %t2477)
  %t2478 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.484)
  %t2479 = ptrtoint ptr %t2478 to i64
  %t2480 = inttoptr i64 %t2479 to ptr
  call void @intrinsic_println(ptr %t2480)
  %t2481 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.485)
  %t2482 = ptrtoint ptr %t2481 to i64
  %t2483 = inttoptr i64 %t2482 to ptr
  call void @intrinsic_println(ptr %t2483)
  %t2484 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.486)
  %t2485 = ptrtoint ptr %t2484 to i64
  %t2486 = inttoptr i64 %t2485 to ptr
  call void @intrinsic_println(ptr %t2486)
  %t2487 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.487)
  %t2488 = ptrtoint ptr %t2487 to i64
  %t2489 = inttoptr i64 %t2488 to ptr
  call void @intrinsic_println(ptr %t2489)
  %t2490 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.488)
  %t2491 = ptrtoint ptr %t2490 to i64
  %t2492 = inttoptr i64 %t2491 to ptr
  call void @intrinsic_println(ptr %t2492)
  %t2493 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.489)
  %t2494 = ptrtoint ptr %t2493 to i64
  %t2495 = inttoptr i64 %t2494 to ptr
  call void @intrinsic_println(ptr %t2495)
  %t2496 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.490)
  %t2497 = ptrtoint ptr %t2496 to i64
  %t2498 = inttoptr i64 %t2497 to ptr
  call void @intrinsic_println(ptr %t2498)
  %t2499 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.491)
  %t2500 = ptrtoint ptr %t2499 to i64
  %t2501 = inttoptr i64 %t2500 to ptr
  call void @intrinsic_println(ptr %t2501)
  %t2502 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.492)
  %t2503 = ptrtoint ptr %t2502 to i64
  %t2504 = inttoptr i64 %t2503 to ptr
  call void @intrinsic_println(ptr %t2504)
  %t2505 = call ptr @intrinsic_string_new(ptr @.str.exp_s_controller.493)
  %t2506 = ptrtoint ptr %t2505 to i64
  %t2507 = inttoptr i64 %t2506 to ptr
  call void @intrinsic_println(ptr %t2507)
  ret i64 0
}


; String constants
@.str.exp_s_controller.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_s_controller.3 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.4 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.5 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.7 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.10 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_controller.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.12 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_s_controller.13 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_s_controller.14 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.16 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.17 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.18 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.19 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.20 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.21 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.22 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_s_controller.23 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_s_controller.24 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.25 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.26 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.27 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.28 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.29 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.30 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.31 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.32 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_s_controller.33 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_s_controller.34 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.35 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_s_controller.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.39 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.41 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.43 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_s_controller.44 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.45 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.47 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.48 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.49 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.50 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.51 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_s_controller.52 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.54 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.55 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.56 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.58 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.62 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.65 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.66 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.68 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.69 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.71 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.72 = private unnamed_addr constant [17 x i8] c"    step=10   S=\00"
@.str.exp_s_controller.73 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.74 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.75 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.76 = private unnamed_addr constant [17 x i8] c"    step=50   S=\00"
@.str.exp_s_controller.77 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.78 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.79 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.80 = private unnamed_addr constant [17 x i8] c"    step=100  S=\00"
@.str.exp_s_controller.81 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.82 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.83 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.84 = private unnamed_addr constant [17 x i8] c"    step=250  S=\00"
@.str.exp_s_controller.85 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.86 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.88 = private unnamed_addr constant [17 x i8] c"    step=499  S=\00"
@.str.exp_s_controller.89 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.90 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.91 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.92 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.93 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.94 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.95 = private unnamed_addr constant [34 x i8] c"  EXP 1: S-CONTROLLED vs FIXED LR\00"
@.str.exp_s_controller.96 = private unnamed_addr constant [36 x i8] c"  3 competing quadratics, 4D params\00"
@.str.exp_s_controller.97 = private unnamed_addr constant [17 x i8] c"  500 steps each\00"
@.str.exp_s_controller.98 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.99 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.100 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.101 = private unnamed_addr constant [34 x i8] c"  Fixed lr=0.01:    final loss = \00"
@.str.exp_s_controller.102 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.103 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_s_controller.104 = private unnamed_addr constant [34 x i8] c"  Fixed lr=0.001:   final loss = \00"
@.str.exp_s_controller.105 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.107 = private unnamed_addr constant [31 x i8] c"  S-controlled (base lr=0.01):\00"
@.str.exp_s_controller.108 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.109 = private unnamed_addr constant [34 x i8] c"  S-controlled:     final loss = \00"
@.str.exp_s_controller.110 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.112 = private unnamed_addr constant [21 x i8] c"  --- Comparison ---\00"
@.str.exp_s_controller.113 = private unnamed_addr constant [44 x i8] c"  S-CONTROLLED WINS: beats both fixed rates\00"
@.str.exp_s_controller.114 = private unnamed_addr constant [45 x i8] c"  S-controlled beats fast LR but not slow LR\00"
@.str.exp_s_controller.115 = private unnamed_addr constant [45 x i8] c"  S-controlled beats slow LR but not fast LR\00"
@.str.exp_s_controller.116 = private unnamed_addr constant [41 x i8] c"  Fixed LR wins on this smooth landscape\00"
@.str.exp_s_controller.117 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_s_controller.118 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.119 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.120 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.121 = private unnamed_addr constant [4 x i8] c"8.0\00"
@.str.exp_s_controller.122 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.123 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.124 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.125 = private unnamed_addr constant [32 x i8] c"  Theoretical optimum:  loss = \00"
@.str.exp_s_controller.126 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.127 = private unnamed_addr constant [22 x i8] c"  Gap (fixed 0.01):  \00"
@.str.exp_s_controller.128 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.129 = private unnamed_addr constant [22 x i8] c"  Gap (S-ctrl):      \00"
@.str.exp_s_controller.130 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.132 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_s_controller.133 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_s_controller.134 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.135 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_s_controller.136 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_s_controller.137 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.138 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_s_controller.139 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.140 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.141 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.142 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.143 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.144 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.145 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.146 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.147 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.148 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.149 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.150 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.151 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.152 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.153 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.154 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.155 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.156 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.157 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.158 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.159 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.160 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.161 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.162 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.163 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.164 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.165 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_controller.166 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.167 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_s_controller.168 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.169 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.170 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.171 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.172 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.173 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.174 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.175 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_controller.176 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.177 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_s_controller.178 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.179 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.180 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.181 = private unnamed_addr constant [4 x i8] c"2.5\00"
@.str.exp_s_controller.182 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.183 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_s_controller.184 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.185 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.186 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.187 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.188 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.189 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.191 = private unnamed_addr constant [17 x i8] c"    step=10   S=\00"
@.str.exp_s_controller.192 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.193 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.194 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.195 = private unnamed_addr constant [17 x i8] c"    step=100  S=\00"
@.str.exp_s_controller.196 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.197 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.198 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.199 = private unnamed_addr constant [17 x i8] c"    step=250  S=\00"
@.str.exp_s_controller.200 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.201 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.202 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.203 = private unnamed_addr constant [17 x i8] c"    step=499  S=\00"
@.str.exp_s_controller.204 = private unnamed_addr constant [6 x i8] c"  lr=\00"
@.str.exp_s_controller.205 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.206 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.207 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.208 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.209 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.210 = private unnamed_addr constant [44 x i8] c"  EXP 2: S-CONTROLLED vs FIXED on RASTRIGIN\00"
@.str.exp_s_controller.211 = private unnamed_addr constant [41 x i8] c"  Non-convex, 3 competing objectives, 4D\00"
@.str.exp_s_controller.212 = private unnamed_addr constant [55 x i8] c"  Start at (3, -2, 2.5, -1.5) — deep in local minima\00"
@.str.exp_s_controller.213 = private unnamed_addr constant [17 x i8] c"  500 steps each\00"
@.str.exp_s_controller.214 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.215 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.216 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.217 = private unnamed_addr constant [34 x i8] c"  Fixed lr=0.01:    final loss = \00"
@.str.exp_s_controller.218 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.219 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_s_controller.220 = private unnamed_addr constant [34 x i8] c"  Fixed lr=0.001:   final loss = \00"
@.str.exp_s_controller.221 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.222 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.223 = private unnamed_addr constant [31 x i8] c"  S-controlled (base lr=0.01):\00"
@.str.exp_s_controller.224 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.225 = private unnamed_addr constant [34 x i8] c"  S-controlled:     final loss = \00"
@.str.exp_s_controller.226 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.227 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.228 = private unnamed_addr constant [21 x i8] c"  --- Comparison ---\00"
@.str.exp_s_controller.229 = private unnamed_addr constant [44 x i8] c"  S-CONTROLLED WINS: beats both fixed rates\00"
@.str.exp_s_controller.230 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.231 = private unnamed_addr constant [32 x i8] c"  Improvement over best fixed: \00"
@.str.exp_s_controller.232 = private unnamed_addr constant [32 x i8] c"  Improvement over best fixed: \00"
@.str.exp_s_controller.233 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.234 = private unnamed_addr constant [42 x i8] c"  S-controlled beats fast but not slow LR\00"
@.str.exp_s_controller.235 = private unnamed_addr constant [42 x i8] c"  S-controlled beats slow but not fast LR\00"
@.str.exp_s_controller.236 = private unnamed_addr constant [29 x i8] c"  Fixed LR wins on Rastrigin\00"
@.str.exp_s_controller.237 = private unnamed_addr constant [62 x i8] c"  (S-control may need stochastic perturbation for non-convex)\00"
@.str.exp_s_controller.238 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.239 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.240 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.241 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.242 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.243 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.244 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.245 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_s_controller.246 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_s_controller.247 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_s_controller.248 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_s_controller.249 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_s_controller.250 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_s_controller.251 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.252 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.253 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.254 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.255 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.256 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.257 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_s_controller.258 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_s_controller.259 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_s_controller.260 = private unnamed_addr constant [5 x i8] c"0.75\00"
@.str.exp_s_controller.261 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.262 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_controller.263 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.264 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.265 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_s_controller.266 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_s_controller.267 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_s_controller.268 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.269 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.270 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.271 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.272 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.273 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.274 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.275 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.276 = private unnamed_addr constant [17 x i8] c"    step=50   S=\00"
@.str.exp_s_controller.277 = private unnamed_addr constant [12 x i8] c"  strength=\00"
@.str.exp_s_controller.278 = private unnamed_addr constant [7 x i8] c"  err=\00"
@.str.exp_s_controller.279 = private unnamed_addr constant [24 x i8] c"  (pre-change, settled)\00"
@.str.exp_s_controller.280 = private unnamed_addr constant [17 x i8] c"    step=101  S=\00"
@.str.exp_s_controller.281 = private unnamed_addr constant [12 x i8] c"  strength=\00"
@.str.exp_s_controller.282 = private unnamed_addr constant [7 x i8] c"  err=\00"
@.str.exp_s_controller.283 = private unnamed_addr constant [23 x i8] c"  (just after change!)\00"
@.str.exp_s_controller.284 = private unnamed_addr constant [17 x i8] c"    step=120  S=\00"
@.str.exp_s_controller.285 = private unnamed_addr constant [12 x i8] c"  strength=\00"
@.str.exp_s_controller.286 = private unnamed_addr constant [7 x i8] c"  err=\00"
@.str.exp_s_controller.287 = private unnamed_addr constant [13 x i8] c"  (adapting)\00"
@.str.exp_s_controller.288 = private unnamed_addr constant [17 x i8] c"    step=199  S=\00"
@.str.exp_s_controller.289 = private unnamed_addr constant [12 x i8] c"  strength=\00"
@.str.exp_s_controller.290 = private unnamed_addr constant [7 x i8] c"  err=\00"
@.str.exp_s_controller.291 = private unnamed_addr constant [10 x i8] c"  (final)\00"
@.str.exp_s_controller.292 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.293 = private unnamed_addr constant [38 x i8] c"  EXP 3: S-CONTROLLED BELIEF REVISION\00"
@.str.exp_s_controller.294 = private unnamed_addr constant [52 x i8] c"  3 beliefs tracking values that CHANGE at step 100\00"
@.str.exp_s_controller.295 = private unnamed_addr constant [30 x i8] c"  Before: A=0.8  B=0.3  C=0.6\00"
@.str.exp_s_controller.296 = private unnamed_addr constant [30 x i8] c"  After:  A=0.2  B=0.9  C=0.4\00"
@.str.exp_s_controller.297 = private unnamed_addr constant [25 x i8] c"  200 observations total\00"
@.str.exp_s_controller.298 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.299 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.300 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.301 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.302 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.303 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.304 = private unnamed_addr constant [37 x i8] c"  Fixed strength=1.0:   avg error = \00"
@.str.exp_s_controller.305 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.306 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.307 = private unnamed_addr constant [42 x i8] c"  S-controlled belief revision (seed=42):\00"
@.str.exp_s_controller.308 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.309 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.310 = private unnamed_addr constant [37 x i8] c"  S-controlled:         avg error = \00"
@.str.exp_s_controller.311 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.312 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.313 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.314 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.315 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.316 = private unnamed_addr constant [37 x i8] c"  Fixed strength=2.0:   avg error = \00"
@.str.exp_s_controller.317 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.318 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.319 = private unnamed_addr constant [21 x i8] c"  --- Comparison ---\00"
@.str.exp_s_controller.320 = private unnamed_addr constant [55 x i8] c"  S-CONTROLLED WINS: adapts faster after regime change\00"
@.str.exp_s_controller.321 = private unnamed_addr constant [53 x i8] c"  S-controlled beats normal but not aggressive fixed\00"
@.str.exp_s_controller.322 = private unnamed_addr constant [53 x i8] c"  Fixed update wins (beliefs may be too noisy for S)\00"
@.str.exp_s_controller.323 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_s_controller.324 = private unnamed_addr constant [40 x i8] c"  Relative improvement over fixed=1.0: \00"
@.str.exp_s_controller.325 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.326 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.327 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_s_controller.328 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_s_controller.329 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.330 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.331 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.332 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.333 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.334 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.335 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.336 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.337 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_s_controller.338 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_s_controller.339 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.340 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.341 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.342 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.343 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.344 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.345 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.346 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.347 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_s_controller.348 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_s_controller.349 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.350 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.351 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.352 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.353 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_s_controller.354 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.355 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.356 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.357 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.358 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.359 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.360 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.361 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.362 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.363 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.364 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.365 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.366 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.367 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_s_controller.368 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.369 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.370 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.371 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.372 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.373 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.374 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.375 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.376 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.377 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_s_controller.378 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.379 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.380 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.381 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.382 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.383 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.384 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.385 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.386 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.387 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_s_controller.388 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.389 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.390 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.391 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.392 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.393 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.394 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.395 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.396 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.397 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.398 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.399 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.400 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.401 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.402 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.403 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_s_controller.404 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.405 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.406 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.407 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.408 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_controller.409 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_s_controller.410 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.411 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_s_controller.412 = private unnamed_addr constant [11 x i8] c"    cycle=\00"
@.str.exp_s_controller.413 = private unnamed_addr constant [5 x i8] c"  S=\00"
@.str.exp_s_controller.414 = private unnamed_addr constant [11 x i8] c"  meta_lr=\00"
@.str.exp_s_controller.415 = private unnamed_addr constant [9 x i8] c"  alpha=\00"
@.str.exp_s_controller.416 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.417 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.418 = private unnamed_addr constant [17 x i8] c"    cycle=14  S=\00"
@.str.exp_s_controller.419 = private unnamed_addr constant [11 x i8] c"  meta_lr=\00"
@.str.exp_s_controller.420 = private unnamed_addr constant [9 x i8] c"  alpha=\00"
@.str.exp_s_controller.421 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.422 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.423 = private unnamed_addr constant [17 x i8] c"    cycle=29  S=\00"
@.str.exp_s_controller.424 = private unnamed_addr constant [11 x i8] c"  meta_lr=\00"
@.str.exp_s_controller.425 = private unnamed_addr constant [9 x i8] c"  alpha=\00"
@.str.exp_s_controller.426 = private unnamed_addr constant [8 x i8] c"  loss=\00"
@.str.exp_s_controller.427 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.428 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.429 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_s_controller.430 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.431 = private unnamed_addr constant [41 x i8] c"  EXP 4: S-CONTROLLED META-LEARNING RATE\00"
@.str.exp_s_controller.432 = private unnamed_addr constant [47 x i8] c"  3 competing losses, learnable conflict alpha\00"
@.str.exp_s_controller.433 = private unnamed_addr constant [30 x i8] c"  Meta-lr itself adapts via S\00"
@.str.exp_s_controller.434 = private unnamed_addr constant [39 x i8] c"  30 meta-cycles, 200 inner steps each\00"
@.str.exp_s_controller.435 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.436 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.437 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_s_controller.438 = private unnamed_addr constant [35 x i8] c"  No conflict scaling:     loss = \00"
@.str.exp_s_controller.439 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.440 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_controller.441 = private unnamed_addr constant [35 x i8] c"  Fixed meta_lr=0.1:       loss = \00"
@.str.exp_s_controller.442 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.443 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_s_controller.444 = private unnamed_addr constant [35 x i8] c"  Fixed meta_lr=0.01:      loss = \00"
@.str.exp_s_controller.445 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.446 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.447 = private unnamed_addr constant [35 x i8] c"  S-controlled (base meta_lr=0.1):\00"
@.str.exp_s_controller.448 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_s_controller.449 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.450 = private unnamed_addr constant [35 x i8] c"  S-controlled meta-lr:    loss = \00"
@.str.exp_s_controller.451 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.452 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.453 = private unnamed_addr constant [21 x i8] c"  --- Comparison ---\00"
@.str.exp_s_controller.454 = private unnamed_addr constant [28 x i8] c"  S-CONTROLLED META-LR WINS\00"
@.str.exp_s_controller.455 = private unnamed_addr constant [32 x i8] c"  Improvement over best fixed: \00"
@.str.exp_s_controller.456 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.457 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_s_controller.458 = private unnamed_addr constant [42 x i8] c"  S-controlled matches fixed (within 0.5)\00"
@.str.exp_s_controller.459 = private unnamed_addr constant [21 x i8] c"  Fixed meta-lr wins\00"
@.str.exp_s_controller.460 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.461 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_s_controller.462 = private unnamed_addr constant [45 x i8] c"#   S AS ADAPTIVE CONTROL SIGNAL           #\00"
@.str.exp_s_controller.463 = private unnamed_addr constant [45 x i8] c"#   Turning S from diagnostic into tool    #\00"
@.str.exp_s_controller.464 = private unnamed_addr constant [45 x i8] c"#                                          #\00"
@.str.exp_s_controller.465 = private unnamed_addr constant [48 x i8] c"#   lr(t) = lr_base * clamp(1+S(t), 0.1, 2.0) #\00"
@.str.exp_s_controller.466 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_s_controller.467 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.468 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.469 = private unnamed_addr constant [31 x i8] c"  SUMMARY: S AS CONTROL SIGNAL\00"
@.str.exp_s_controller.470 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_s_controller.471 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.472 = private unnamed_addr constant [55 x i8] c"  Exp 1 (Quadratic): S-controlled lr adapts aggression\00"
@.str.exp_s_controller.473 = private unnamed_addr constant [56 x i8] c"    to convergence state. On smooth landscapes, S stays\00"
@.str.exp_s_controller.474 = private unnamed_addr constant [39 x i8] c"    high and lr climbs toward 2x base.\00"
@.str.exp_s_controller.475 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.476 = private unnamed_addr constant [55 x i8] c"  Exp 2 (Rastrigin): On non-convex landscapes, S drops\00"
@.str.exp_s_controller.477 = private unnamed_addr constant [56 x i8] c"    near local minima (oscillating loss), automatically\00"
@.str.exp_s_controller.478 = private unnamed_addr constant [57 x i8] c"    reducing lr. S rises in smooth basins, accelerating.\00"
@.str.exp_s_controller.479 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.480 = private unnamed_addr constant [52 x i8] c"  Exp 3 (Beliefs): After regime change at step 100,\00"
@.str.exp_s_controller.481 = private unnamed_addr constant [55 x i8] c"    S drops sharply (beliefs destabilised), triggering\00"
@.str.exp_s_controller.482 = private unnamed_addr constant [56 x i8] c"    faster evidence incorporation. S-controlled beliefs\00"
@.str.exp_s_controller.483 = private unnamed_addr constant [53 x i8] c"    should adapt faster than fixed-strength updates.\00"
@.str.exp_s_controller.484 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.485 = private unnamed_addr constant [52 x i8] c"  Exp 4 (Meta-LR): When interaction matrix is good,\00"
@.str.exp_s_controller.486 = private unnamed_addr constant [58 x i8] c"    S is high and meta-lr drops (dont fix whats working).\00"
@.str.exp_s_controller.487 = private unnamed_addr constant [62 x i8] c"    When S drops, meta-lr increases (strategy change needed).\00"
@.str.exp_s_controller.488 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_s_controller.489 = private unnamed_addr constant [55 x i8] c"  KEY INSIGHT: S is not just a convergence diagnostic.\00"
@.str.exp_s_controller.490 = private unnamed_addr constant [52 x i8] c"  It is a universal adaptive control signal for any\00"
@.str.exp_s_controller.491 = private unnamed_addr constant [53 x i8] c"  learning process. This feeds directly into Simplex\00"
@.str.exp_s_controller.492 = private unnamed_addr constant [30 x i8] c"  meta-gradient architecture.\00"
@.str.exp_s_controller.493 = private unnamed_addr constant [45 x i8] c"============================================\00"
